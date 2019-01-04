//
//  ContactController.swift
//  Contacts
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class ContactController {
    
    // MARK: - Singleton
    static let shared = ContactController()
    
    // MARK: - Properties
    var contacts: [Contact] = []
    
    // setting up the public cloud database constant for use
    let publicDB = CKContainer.default().publicCloudDatabase
    
    // MARK: - CRUD
    // save when called by add contact
    func save(contact: Contact, completion: @escaping (Bool) -> ()) {
        
        // turning the contact into a CKRecord
        let contact = CKRecord(contact: contact)
        
        // makeing the save call to the public database
        publicDB.save(contact) { (record, error) in
            
            // Checking for errors
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // Checking to ensure the record and contact exist
            guard let record = record, let contact = Contact(ckRecord: record) else {
                completion(false)
                return
            }
            
            // Adding the contac to the contacts array
            self.contacts.append(contact)
            completion(true)
        }
    }
    
    // Add contact
    func addContactWith(name: String, phoneNumber: String, email: String, completion: @escaping (Bool) -> Void) {
        
        // Setting constant contacgt to the new data
        let contact = Contact(name: name, phoneNumber: phoneNumber, email: email)
        
        // Saving the data to CloudKit
        self.save(contact: contact) { (success) in
            
            // Checking success of the save operaion
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    // Fetching all contacts
    func fetchContacts(completion: @escaping (Bool) -> ()) {
        
        // Setting up predicate to fetch all the entries
        let predicate = NSPredicate(value: true)
        
        // Setting up the query to get all the records
        let query = CKQuery(recordType: contactKeys.recordKey, predicate: predicate)
        
        publicDB.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // Checking the records exist by unwrapping
            guard let records = records else {
                completion(false)
                return
            }
            
            // Iterating through the records to change CKRecords into contacts data model
            print("Iterating")
            let contacts = records.compactMap { Contact(ckRecord: $0) }
            self.contacts = contacts
            completion(true)
        }
    }
    
    // Updating contacts
    func updateContact(contact: Contact, name: String, phoneNumber: String, email: String, completion: @escaping (Bool) -> Void) {
        contact.name = name
        contact.phoneNumber = phoneNumber
        contact.email = email
        
        // Fetching record with record ID
        publicDB.fetch(withRecordID: contact.ckRecordId) { (record, error) in
            
            // Checking fetch for errors
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            // Checking the records are there by unwrapping
            guard let record = record else {
                completion(false)
                return
            }
            
            // Assinging the updated data to the record keys
            record[contactKeys.nameKey] = name
            record[contactKeys.phoneNumberKey] = phoneNumber
            record[contactKeys.emailKey] = email
            
            // Setting up the update perameters
            let updateOperation = CKModifyRecordsOperation(recordsToSave: [record], recordIDsToDelete: nil)
            updateOperation.savePolicy = .changedKeys
            updateOperation.queuePriority = .normal
            updateOperation.qualityOfService = .userInitiated
            updateOperation.modifyRecordsCompletionBlock = { (records, reorderIDs, error) in
                completion(true)
            }
            
            // Updating the record
            self.publicDB.add(updateOperation)
        }
    }
    
    // deleting a contact
    func deleteContact(contact: Contact, completion: @escaping (Bool) -> Void) {
        
        // Deleting from CloudKit
        publicDB.delete(withRecordID: contact.ckRecordId) { (_, error) in
            
            // Checking for errors
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            } else {
                completion(true)
            }
        }
        
        // Getting the index of the delted contact
        guard let index = ContactController.shared.contacts.index(of: contact) else { return }
        
        // Removing the deleted contact from the array
        ContactController.shared.contacts.remove(at: index)
    }
}
