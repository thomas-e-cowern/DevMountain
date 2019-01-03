//
//  EntryController.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

typealias successCompletion = (_ success: Bool) -> Void

class EntryController {
    // MARK: - Properties
    static let shared = EntryController()
    private init() {}
    
    var entries = [Entry]()
    
    // MARK: - CRUD
    func createEntryWith(text: String, completion: @escaping successCompletion) {
        
        // getting the logged in pet owner
        guard let loggedInPetOwner = PetOwnerController.shared.loggedInPetOwner else {
            completion(false)
            return
        }
        
        // getting the CKRecord of the logged in pet owner
        let loggedInPetOwnerRecord = CKRecord(petOwner: loggedInPetOwner)
        
        // getting the reference to the logged in pet owner
        let petOwnerReference = CKRecord.Reference(record: loggedInPetOwnerRecord, action: .deleteSelf)
        
        // creating and saving the entry for the logged in pet owner
        let entry = Entry(text: text, petOwnerReference: petOwnerReference)
        save(entry: entry) { (success) in
            completion(success)
        }
    }
    
    private func save(entry: Entry, completion: @escaping successCompletion) {
        let entryToSaveRecord = CKRecord(entry)
        CKContainer.default().privateCloudDatabase.save(entryToSaveRecord) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let record = record else {
                completion(false)
                return
            }
            
            guard let validatedEntry = Entry(ckRecord: record) else {
                completion(false)
                return
            }
            
            self.entries.append(validatedEntry)
            completion(true)
        }
    }
    
    func fetchEntries(completion: @escaping successCompletion) {
        
        // getting the logged in user
        guard let loggedInUser = PetOwnerController.shared.loggedInPetOwner else {
            completion(false)
            return
        }
        
        // setting the predicate to get records from the logged in user
        let predicate = NSPredicate(format: "petOwnerReference == %@", loggedInUser.ckRecordId)
        
        // getting the entries associated with the logged in user
        let query = CKQuery(recordType: Entry.EntryKeys.entry, predicate: predicate)
        
        // executint the fetch
        CKContainer.default().privateCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            
            // checking for errors in the fetch
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // checking records to make sure they are there
            guard let records = records else {
                completion(false)
                return
            }
            
            // iterate through the records
            let fetchedEntries = records.compactMap { Entry(ckRecord: $0) }
            
//            var entries = [Entry]()
//            for record in records {
//                guard let entry = Entry(ckRecord: record) else { continue }
//                entries.append(entry)
//            }
            // add them to the entries array
            self.entries = fetchedEntries
            completion(true)
        }
    }
    
    func delete(entry: Entry, completion: @escaping successCompletion) {
        CKContainer.default().privateCloudDatabase.delete(withRecordID: entry.ckRecordId) { (recordId, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let recordId = recordId else {
                completion(false)
                return
            }

            guard let indexPath = self.entries.firstIndex(where: { (entry) -> Bool in
                    return entry.ckRecordId == recordId
            }) else {
                completion(false)
                return
            }
            self.entries.remove(at: indexPath)
            completion(true)
            return
        }
    }
}
