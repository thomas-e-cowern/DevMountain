//
//  Song.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Song: Equatable, Codable {
   
    // MARK: - Properties
    let artist: String
    let name: String
    
    // MARK: - Initialization
    init(artist: String, name: String) {
        self.artist = artist
        self.name = name
    }
    
    // MARK: - Equatable
    static func == (lhs: Song, rhs: Song) -> Bool {
        if lhs.artist == rhs.artist && lhs.name == lhs.name {
            return true
        } else {
            return false
        }
    }
    
}
