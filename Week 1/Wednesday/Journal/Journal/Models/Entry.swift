//
//  Entry.swift
//  Journal
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Entry: Equatable {
    
    // MARK: - Equatable
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        if lhs.title == rhs.title &&  lhs.text == rhs.text && lhs.timeStamp.isEqual(to: rhs.timeStamp) {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - properties
    var title: String
    var text: String
    var timeStamp: Double {
        return NSDate().timeIntervalSince1970
    }
    
    // MARK: - Initializers
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }

}
