//
//  EntryController.swift
//  JournalCloudKit
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class EntryController {
    
    // MARK: - Singleton
    static let shared = EntryController()
    
    // MARK: - Properties
    var entries: [Entry] = []
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    // MARK: - CRUD
    func save(entry: Entry, completion: @escaping (Bool) -> ()) {
        
        let newEntry = CKRecord(entry: entry)
        
        CKContainer.default().publicCloudDatabase.save(newEntry) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let record = record, let entry = Entry(ckRecord: record) else {
                completion(false)
                return
            }
            
            self.entries.append(entry)
            completion(true)
        }
    }
    
    func addEntryWith(title: String, body: String, completion: @escaping (Bool) -> Void) {
        let entry = Entry(title: title, bodyText: body)
        self.save(entry: entry) { (success) in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func fetchEntries(completion: @escaping (Bool) -> ()) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: Constants.recordKey, predicate: predicate)
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let records = records else {
                completion(false)
                return
            }
            
            let entries = records.compactMap { Entry(ckRecord: $0) }
            self.entries = entries
            completion(true)
        }
    }
    
    func updateEntry(entry: Entry, title: String, body: String, completion: @escaping (Bool) -> Void) {
        entry.title = title
        entry.bodyText = body
        
        publicDB.fetch(withRecordID: entry.ckRecordID) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let record = record else {
                completion(false)
                return
            }
            
            record[Constants.titleKey] = title
            record[Constants.bodyKey] = body
            
            let updateOperation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
            updateOperation.savePolicy = .changedKeys
            updateOperation.queuePriority = .normal
            updateOperation.qualityOfService = .userInitiated
            updateOperation.modifyRecordsCompletionBlock = { (records, reorderIDs, error) in
                completion(true)
            }
            self.publicDB.add(updateOperation)
        }
    }
    
    func deleteRecord(entry: Entry, completion: @escaping (Bool) -> Void) {

        publicDB.delete(withRecordID: entry.ckRecordID) { (_, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            } else {
                print("Record deleted from CloudKit")
                completion(true)
            }
        }
        
        guard let index = EntryController.shared.entries.index(of: entry) else {
            return
        }
        EntryController.shared.entries.remove(at: index)
        
    }
    
    func createShare(with entry: Entry, completion: @escaping (CKShare?, CKContainer?, Error?) -> Void) {
        
        // Creating rootrecord and sharerecord and creating share
        let rootRecord = CKRecord(entry: entry)
        let shareRecord = CKShare(rootRecord: rootRecord)
        
        // Creating operation to share record
        let operation = CKModifyRecordsOperation(recordsToSave: [shareRecord, rootRecord], recordIDsToDelete: nil)
        operation.perRecordCompletionBlock = { (record, error) in
            if let error = error {
                print("😡 Error sharing \(entry.title): \(error.localizedDescription)")
                completion(nil, nil, error)
            }
        }
        operation.modifyRecordsCompletionBlock = { (savedRecords, deletedRecordsIDs, error) in
            if let error = error {
                print("😡 Error sharing \(entry.title): \(error.localizedDescription)")
                completion(nil, nil, error)
            } else {
                completion(shareRecord, CKContainer.default(), nil)
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
    }
}
