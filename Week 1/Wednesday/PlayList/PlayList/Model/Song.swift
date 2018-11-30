//
//  Song.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Song: Equatable, Codable {
    
    var name: String
    var artist: String
    
    init(nameFromUser: String, artist: String) {
        self.name = nameFromUser
        self.artist = artist
        
    }
    
}

func ==(lhs: Song, rhs: Song) -> Bool {
    if lhs.name == rhs.name && lhs.artist == rhs.artist {
        return true
    } else {
        return false
    }
}
