//
//  TokController.swift
//  TikTok2
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class TokController {
    
    // MARK: - Shared isntance
    static let shared = TokController()
    private init() {}
    
    // MARK: - Setting public DB
    let publicDB = CKContainer.default().publicCloudDatabase
    
    // MARK: - Source of truth
    var toks: [Tok] = []
    
    // MARK: - Sharing
    func createShare(with tok: Tok, completion: @escaping (CKShare?, CKContainer?, Error?) -> Void) {
        // creating root record
        let root = CKRecord(recordType: Keys.tokRecordType)
        let rootRecord = CKRecord(recordType: Keys.tokRecordType, recordID: tok.ckRecordId)
        // creating share
        let sharedRecord = CKShare(rootRecord: root)
        let operation = CKModifyRecordsOperation(recordsToSave: [sharedRecord], recordIDsToDelete: nil)
        
        // creating operation
        operation.perRecordCompletionBlock = { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil, nil, error)
            }
        }
        
        operation.modifyRecordsCompletionBlock = { (savedRecords, deletedRecordIds, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil, nil, error)
            } else {
                completion(sharedRecord, CKContainer.default(), nil)
            }
        }
        
        publicDB.add(operation)
    }
    
    // MARK: - CRUD
    func birthYoungTok(title: String, text: String, completion: ((Tok?) -> Void)?) {
        let youngTok = Tok(title: title, text: text)
        self.toks.append(youngTok)
        
        CKContainer.default().publicCloudDatabase.save(youngTok.asCKRecord) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion?(nil)
                return
            }
            
            guard let record = record else {
                completion?(nil)
                return
            }
            
            let tok = Tok(ckRecord: record)
            completion?(tok)
            
        }
    }
    
    func fetchAllToks(completion: @escaping ([Tok]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: Keys.tokRecordType, predicate: predicate)
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let records = records else {
                completion([])
                return
            }
            
            let mappedToks = records.compactMap{ Tok(ckRecord: $0) }
            self.toks = mappedToks
            completion(mappedToks)
        }
    }
    
    func update(tok: Tok, upVotes: Int, downVotes: Int, completion: @escaping (Bool) -> Void) {
        tok.upVotes = upVotes
        tok.downVotes = downVotes
        
        publicDB.fetch(withRecordID: tok.ckRecordId) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let record = record else {
                completion(false)
                return
            }
            
            record[Keys.upVotesKey] = upVotes
            record[Keys.downVotesKey] = downVotes
            
            let updateOperation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
            updateOperation.savePolicy = .changedKeys
            updateOperation.queuePriority = .normal
            updateOperation.qualityOfService = .userInitiated
            updateOperation.modifyRecordsCompletionBlock = { (records, reorderIDs, error) in completion(true)}
            
            self.publicDB.add(updateOperation)
        }
    }
    
    func delete(tok: Tok, completion: @escaping (Bool) -> Void) {
        CKContainer.default().publicCloudDatabase.delete(withRecordID: tok.ckRecordId) { (_, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    
}
