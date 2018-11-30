//
//  PlaylistController.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class PlaylistController {
    
    // MARK: - Properties
    static let shared = PlaylistController()
    
    var playlists: [Playlist] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    // MARK: - CRUD
    
    func create(name: String) {
        let playlist = Playlist(nameFromUser: name)
        self.playlists.append(playlist)
        saveToPersistentStore()
    }

    func delete(playlist: Playlist) {
        if let index = playlists.index(of: playlist) {
            self.playlists.remove(at: index)
            saveToPersistentStore()
        }
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        playlist.songs.append(song)
        saveToPersistentStore()
    }
    
    func remove(song: Song, fromPlaylist playlist: Playlist) {
        if let index = playlist.songs.index(of: song) {
            playlist.songs.remove(at: index)
            saveToPersistentStore()
        }
    }
    
    // MARK: - Persistence
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "playlists.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(playlists)
//            print(data)
//            print(String(data: data, encoding: .utf8)!)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
        
    }
    
    func loadFromPersistentStore() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let playlists = try decoder.decode([Playlist].self, from: data)
            self.playlists = playlists
        } catch let error {
            print(error)
        }
        
    }
}
