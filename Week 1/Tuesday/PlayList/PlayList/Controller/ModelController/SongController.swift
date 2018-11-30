//
//  SongController.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class SongController {
    
    static func createNewSong(songName: String, artistName: String, playlist: Playlist) {
        let song = Song(nameFromUser: songName, artist: artistName)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)
    }
    
}
