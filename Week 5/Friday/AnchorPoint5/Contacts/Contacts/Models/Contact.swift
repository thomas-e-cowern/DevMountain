//
//  Contact.swift
//  Contacts
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

struct contactKeys {
    static let recordKey = "contact"
    static let nameKey = "name"
    static let phoneNumberKey = "phoneNumber"
    static let emailKey = "email"
}

class Contact: Equatable, SearchableRecord {

    // MARK: - Properties
    var name: String
    var phoneNumber: String?
    var email: String?
    let ckRecordId: CKRecord.ID
    
    // MARK: - Initializers
    init(name: String, phoneNumber: String, email: String, ckRecordId: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.ckRecordId = ckRecordId
    }
    
    convenience init?(ckRecord: CKRecord) {
        guard let name = ckRecord[contactKeys.nameKey] as? String,
        let phoneNumber = ckRecord[contactKeys.phoneNumberKey] as? String,
            let email = ckRecord[contactKeys.emailKey] as? String else { return nil }
        
        self.init(name: name, phoneNumber: phoneNumber, email: email, ckRecordId: ckRecord.recordID)
        
    }
    
    // MARK: - Equatable
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        if lhs.ckRecordId == rhs.ckRecordId {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - SearchableRecord
    func matches(searchTerm: String) -> Bool {
        if name.lowercased().contains(searchTerm.lowercased()) {
            return true
        } else {
            return false
        }
    }
}

extension CKRecord {
    // MARK: - Initializer
    convenience init(contact: Contact) {
        self.init(recordType: contactKeys.recordKey, recordID: contact.ckRecordId)
        
        self.setValue(contact.name, forKey: contactKeys.nameKey)
        self.setValue(contact.phoneNumber, forKey: contactKeys.phoneNumberKey)
        self.setValue(contact.email, forKey: contactKeys.emailKey)
    }
}
