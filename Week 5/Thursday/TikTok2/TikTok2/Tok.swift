//
//  Tok.swift
//  TikTok2
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import CloudKit

class Tok {
    
    let title: String
    let text: String
    let ckRecordId: CKRecord.ID
    var upVotes: Int
    var downVotes: Int
    let timeStamp: Date
    
    init(title: String, text: String, ckRecordId: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString), upVotes: Int = 0, downVotes: Int = 0, timeStamp: Date = Date()) {
        self.title = title
        self.text = text
        self.ckRecordId = ckRecordId
        self.upVotes = upVotes
        self.downVotes = downVotes
        self.timeStamp = timeStamp
    }
    
    convenience init?(ckRecord: CKRecord) {
        guard let text = ckRecord[Keys.textKey] as? String,
        let title = ckRecord[Keys.titleKey] as? String,
        let upVotes = ckRecord[Keys.upVotesKey] as? Int,
        let downVotes = ckRecord[Keys.downVotesKey] as? Int,
        let timeStamp = ckRecord[Keys.timeStampKey] as? Date else { return nil }
        
        self.init(title: title, text: text, ckRecordId: ckRecord.recordID, upVotes: upVotes, downVotes: downVotes, timeStamp: timeStamp)
    }
    
    var asCKRecord: CKRecord {
        let newRecord = CKRecord(recordType: Keys.tokRecordType, recordID: self.ckRecordId)

        newRecord.setValue(self.title, forKey: Keys.titleKey)
        newRecord.setValue(self.title, forKey: Keys.textKey)
        newRecord.setValue(self.upVotes, forKey: Keys.upVotesKey)
        newRecord.setValue(self.downVotes, forKey: Keys.downVotesKey)
        newRecord.setValue(self.timeStamp, forKey: Keys.timeStampKey)

        return newRecord
    }
}

//extension CKRecord {
//    convenience init(tok: Tok) {
//        self.init(recordType: Keys.tokRecordType, recordID: tok.ckRecordId)
//
//        self.setValue(tok.title, forKey: Keys.titleKey)
//        self.setValue(tok.title, forKey: Keys.textKey)
//        self.setValue(tok.upVotes, forKey: Keys.upVotesKey)
//        self.setValue(tok.downVotes, forKey: Keys.downVotesKey)
//        self.setValue(tok.timeStamp, forKey: Keys.timeStampKey)
//    }
//}

struct Keys {
    static let tokRecordType = "Tok"
    static let textKey = "text"
    static let titleKey = "title"
    static let upVotesKey = "upVotes"
    static let downVotesKey = "downVotes"
    static let timeStampKey = "timeStamp"
}

