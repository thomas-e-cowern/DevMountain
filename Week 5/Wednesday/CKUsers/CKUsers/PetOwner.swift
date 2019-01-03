//
//  PetOwner.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class PetOwner {
    // MARK: - properties
    let username: String
    let password: String
    let petName: String
    
    // CloudKit
    var ckRecordId: CKRecord.ID
    let appleUserReference: CKRecord.Reference
    
    // MARK: - Keys
    enum petOwnerKeys {
        static let usernameKey = "username"
        static let passwordKey = "password"
        static let petNameKey = "petName"
        static let appleUserReferenceKey = "appleUserReference"
        static let petOwner = "PetOwner"
    }
    
    // MARK: - Initialization
    // Memberwise
    init(username: String, password: String, petName: String, appleUserReference: CKRecord.Reference, ckRecordId: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.username = username
        self.password = password
        self.petName = petName
        self.appleUserReference = appleUserReference
        self.ckRecordId = ckRecordId
    }
    
    // Convenience
    convenience init?(ckRecord: CKRecord) {
        guard let username = ckRecord[petOwnerKeys.usernameKey] as?String,
            let password = ckRecord[petOwnerKeys.passwordKey] as? String,
            let petName = ckRecord[petOwnerKeys.petNameKey] as? String,
            let appleUserReference = ckRecord[petOwnerKeys.appleUserReferenceKey] as? CKRecord.Reference else { return nil }
        
        self.init(username: username, password: password, petName: petName, appleUserReference: appleUserReference, ckRecordId: ckRecord.recordID)
    }
}

extension CKRecord {
    convenience init(petOwner: PetOwner) {
        self.init(recordType: PetOwner.petOwnerKeys.petOwner, recordID: petOwner.ckRecordId)
        
        self.setValue(petOwner.username, forKey: PetOwner.petOwnerKeys.usernameKey)
        self.setValue(petOwner.password, forKey: PetOwner.petOwnerKeys.passwordKey)
        self.setValue(petOwner.petName, forKey: PetOwner.petOwnerKeys.petNameKey)
        self.setValue(petOwner.appleUserReference, forKey: PetOwner.petOwnerKeys.appleUserReferenceKey)
    }
}
