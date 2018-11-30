//
//  Playlist.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Playlist: Equatable, Codable {
    
    // MARK: - Properties
    let name: String
    var songs: [Song]
    var numberOfSongs: Int { // Gets computed every time it gets called
        return songs.count
    }
    
    // MARK: - Initialization
    init(name: String, songs: [Song]) {
        self.name = name
        self.songs = songs
    }
    
    // MARK: - equatable
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        if lhs.name == rhs.name && lhs.songs == rhs.songs {
            return true
        } else {
            return false
        }
    }
}
