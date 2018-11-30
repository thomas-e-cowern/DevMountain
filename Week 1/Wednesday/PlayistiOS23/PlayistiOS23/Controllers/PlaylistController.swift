//
//  PlaylistController.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class PlaylistController {
    // MARK: - Properties
        // MARK: - Singleton // also called shared instance
    static let shared = PlaylistController()
    
        // MARK: - Source of truth // Data source
    var playlists: [Playlist] = []
    
    // MARK: - CRUD Functions
        // MARK: - Create
    func createPlaylistWith(name: String) {
        let newPlaylist = Playlist(name: name, songs: [])
        playlists.append(newPlaylist)
    }
    
        // MARK: - Read
    
        // MARK: - Update
    // Add Song
    func add(song: Song, to playlist: Playlist)  {
        // Make sure playlist exits in playlist array
        if let index = playlists.index(of: playlist) {
            let playListWeAreLookingFor = playlists[index]
            playListWeAreLookingFor.songs.append(song)
            
        }
    }
    
        // MARK: - Delete
    func delete(playlist: Playlist) {
        if let index = playlists.index(of: playlist) {
            playlists.remove(at: index)
        }
    }
    
    func remove(song: Song, from playlist: Playlist) {
        if let indexOfSong = playlist.songs.index(of: song) {
            playlist.songs.remove(at: indexOfSong)
        }
    }
}
