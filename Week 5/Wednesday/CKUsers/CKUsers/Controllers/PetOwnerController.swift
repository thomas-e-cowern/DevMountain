//
//  PetOwnerController.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class PetOwnerController {
    // MARK: - Properties
    // Singleton
    static let shared = PetOwnerController()
    private init() {}
    var loggedInPetOwner: PetOwner?
    
    // MARK: - CRUD
    // Create pet owner
    func createPetOwner(with username: String, password: String, petname: String, completion: @escaping (_ success: Bool) -> Void) {
        // Fetch the icloud user record ID
        CKContainer.default().fetchUserRecordID { (appleUserRecordId, error) in
            if let error = error {
                print("Error obtianing user record ID: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let appleUserRecordId = appleUserRecordId else {
                completion(false)
                return
            }
            let referenceToAppleUser = CKRecord.Reference(recordID: appleUserRecordId, action: .deleteSelf)
            let petOwner = PetOwner(username: username, password: password, petName: petname, appleUserReference: referenceToAppleUser)
            self.save(petOwner: petOwner, completion: { (success) in
                completion(success)
            })
        }
    }
    
    func save(petOwner: PetOwner, completion: @escaping (_ success: Bool) -> Void) {
        let petOwnerRecord = CKRecord(petOwner: petOwner)
        CKContainer.default().privateCloudDatabase.save(petOwnerRecord) { (record, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let record = record else {
                completion(false)
                return
            }
            guard let loggedInPetOwner = PetOwner(ckRecord: record) else {
                completion(false)
                return
            }
            self.loggedInPetOwner = loggedInPetOwner
            completion(true)
        }
    }
    
    // Fetch pet owner
    func fetchCurrentPetOwner(completion: @escaping (_ success: Bool) -> Void) {
        
        // fetch user record ID
        CKContainer.default().fetchUserRecordID { (appleUserRecordId, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let appleUserRecordId = appleUserRecordId else {
                completion(false)
                return
            }
            // predicate / query
            let predicate = NSPredicate(format: "appleUserReference == %@", appleUserRecordId)
            
            let query = CKQuery(recordType: PetOwner.petOwnerKeys.petOwner, predicate: predicate)
            
            // perform on database with query -> CKRecords
            CKContainer.default().privateCloudDatabase.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                if let error = error {
                    print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                guard let records = records else {
                    completion(false)
                    return
                }
                 // Turn CKRecords into petOwner
                guard let firstRecord = records.first else {
                    completion(false)
                    return
                }
                
                 // Set loggedInPetOwner
                let loggedInPetOwner = PetOwner(ckRecord: firstRecord)
                self.loggedInPetOwner = loggedInPetOwner
                completion(true)
            })
        }
    }
}
