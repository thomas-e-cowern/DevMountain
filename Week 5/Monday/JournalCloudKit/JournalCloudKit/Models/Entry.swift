//
//  Entry.swift
//  JournalCloudKit
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

struct Constants {
    static let recordKey = "Entry"
    static let titleKey = "Title"
    static let bodyKey = "Body"
}

class Entry: Equatable {
    // MARK: - Properties
    var title: String
    var bodyText: String
    let ckRecordID: CKRecord.ID
    
    // MARK: - Initializers
    init(title: String, bodyText: String, ckRecordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.title = title
        self.bodyText = bodyText
        self.ckRecordID = ckRecordID
    }
    
    convenience init?(ckRecord: CKRecord) {
        guard let title = ckRecord[Constants.titleKey] as? String,
            let body = ckRecord[Constants.bodyKey] as? String else { return nil }
        
        self.init(title: title, bodyText: body, ckRecordID: ckRecord.recordID)
    }
    
    // MARK: - Equitable
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.ckRecordID == rhs.ckRecordID {
            return true
        } else {
            return false
        }
    }
}

extension CKRecord {
    
    // MARK: - Initializer
    convenience init(entry: Entry) {
        self.init(recordType: Constants.recordKey, recordID: entry.ckRecordID)
        
        self.setValue(entry.title, forKey: Constants.titleKey)
        self.setValue(entry.bodyText, forKey: Constants.bodyKey)
    }
}
