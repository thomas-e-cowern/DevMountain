//
//  Playlist.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Playlist: Equatable, Codable {
    
    var name: String
    var songs: [Song]
    
    init(nameFromUser: String, songs: [Song] = []) {
        self.name = nameFromUser
        self.songs = songs
    }
    
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool {
    if lhs.name == rhs.name && lhs.songs == rhs.songs {
        return true
    } else {
        return false
    }
}
