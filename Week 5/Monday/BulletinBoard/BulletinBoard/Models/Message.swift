//
//  Message.swift
//  BulletinBoard
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class Message {
    
    static let RecordType = "Message"
    private let TextKey = "text"
    private let TimeStampKey = "timestamp"
    
    let text: String
    let timestamp: Date
    
    init(text: String, timeStamp: Date = Date()) {
        self.text = text
        self.timestamp = timeStamp
    }
    
    init?(cloudKitRecord: CKRecord) {
        // 1 - Get all of the properties you need out of the dictionary (CKRecord) guard else return nil
        guard let text = cloudKitRecord[TextKey] as? String, let timestamp = cloudKitRecord[TimeStampKey] as? Date else { return nil }
        
        // 2 - initiliaze the properties with the values from step 1
        self.text = text
        self.timestamp = timestamp
    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: Message.RecordType)
        record.setValue(text, forKey: TextKey)
        record[TimeStampKey] = timestamp
        
        return record
    }
    
    
}

