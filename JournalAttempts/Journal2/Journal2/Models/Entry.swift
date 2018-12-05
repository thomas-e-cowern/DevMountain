//
//  Entry.swift
//  Journal2
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    var body: String
    var timeStamp: Date?
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
        self.timeStamp = Date()
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.title == rhs.title, lhs.body == rhs.body, lhs.timeStamp == rhs.timeStamp {
            return true
        } else {
            return false
        }
    }
}

