//
//  Post.swift
//  Post
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct Post {
    let username: String
    let text: String
    let timestamp: TimeInterval
    
    init(username: String, text: String, timestamp: TimeInterval = Date().timeIntervalSince1970) {
        self.username = username
        self.text = text
        self.timestamp = timestamp
    }
}
