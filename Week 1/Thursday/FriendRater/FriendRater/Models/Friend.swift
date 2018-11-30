//
//  Friend.swift
//  FriendRater
//
//  Created by Thomas Cowern New on 11/29/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Friend: Equatable, Codable {
    
    // MARK: - properties
    var name: String
    var rating: Int
    
    // MARK: - Initialization
    init(name: String, rating: Int) {
        self.name = name
        self.rating = rating
    }
    
    // MARK: - Equatable
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        
        if lhs.name == rhs.name && lhs.rating == rhs.rating { return true }
        
        return false
        
    }
}
