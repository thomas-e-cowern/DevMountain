//
//  SongController.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class SongController {
    
    // MARK: - shared instance
    static let shared = SongController()
    
    // MARK: - CRUD
    
    func createSong(name: String, artist: String, playlist: Playlist) {
        let song = Song(artist: artist, name: name)
        PlaylistController.shared.add(song: song, to: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    func delete(song: Song, from playlist: Playlist) {
        guard let index = playlist.songs.index(of: song) else { return }
        playlist.songs.remove(at: index)
        PlaylistController.shared.saveToPersistentStore()
    }
}
