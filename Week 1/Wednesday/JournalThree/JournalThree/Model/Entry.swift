//
//  Entry.swift
//  JournalThree
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    var title: String
    var text: String
    let timeStamp: Double = Date().timeIntervalSince1970
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.title == rhs.title && lhs.text == rhs.text && lhs.timeStamp == rhs.timeStamp {
            return true
        } else {
             return false
        }
    }
    
}
