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
    
    private init(){
        self.playlists = loadFromPersisteneStore()
    }
    
    // MARK: - CRUD Functions
        // MARK: - Create
    func createPlaylistWith(name: String) {
        let newPlaylist = Playlist(name: name, songs: [])
        playlists.append(newPlaylist)
        self.saveToPersistentStore()
    }
    
        // MARK: - Read
    
        // MARK: - Update
    // Add Song
    func add(song: Song, to playlist: Playlist)  {
        // Make sure playlist exits in playlist array
        if let index = playlists.index(of: playlist) {
            let playListWeAreLookingFor = playlists[index]
            playListWeAreLookingFor.songs.append(song)
            self.saveToPersistentStore()
        }
    }
    
        // MARK: - Delete
    func delete(playlist: Playlist) {
        if let index = playlists.index(of: playlist) {
            playlists.remove(at: index)
            self.saveToPersistentStore()
        }
    }
    
    func remove(song: Song, from playlist: Playlist) {
        if let indexOfSong = playlist.songs.index(of: song) {
            playlist.songs.remove(at: indexOfSong)
            self.saveToPersistentStore()
        }
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "playlists.json"
        let fullURLL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURLL)
        
        return(fullURLL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.playlists)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersisteneStore() -> [Playlist] {
        
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let playlists = try decoder.decode([Playlist].self, from: data)
            return playlists
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
}
