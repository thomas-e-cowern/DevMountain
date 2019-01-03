//
//  Comment.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        if searchTerm == text {
            return true
        } else {
            return false
        }
    }
    
    var text: String
    var timestamp: Date
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post?) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}
