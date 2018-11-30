//
//  PlaylistController.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let shared = PlaylistController()
    
    var playlists: [Playlist] = []
    
    // CRUD
    
    func create(name: String) {
        let playlist = Playlist(nameFromUser: name)
        self.playlists.append(playlist)
    }
    
    func update(playlist: Playlist) {
        
    }
    
    func delete(playlist: Playlist) {
        if let index = playlists.index(of: playlist) {
            self.playlists.remove(at: index)
        }
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        if let index = playlist.songs.index(of: song) {
            playlist.songs.remove(at: index)
        }
    }
    
}
