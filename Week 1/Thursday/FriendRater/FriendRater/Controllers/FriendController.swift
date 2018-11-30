//
//  FriendController.swift
//  FriendRater
//
//  Created by Thomas Cowern New on 11/29/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class FriendController {
    
    // MARK: - Singleton
    static let shared = FriendController()
    
    // MARK: - Source of truth
    var friends: [Friend] = []
    
    // MARK: - CRUD
    func createFriend(name: String, rating: Int) {
        let newFriend = Friend(name: name, rating: rating)
        friends.append(newFriend)
        saveToPersistentStore()
    }
    
    func update(friend: Friend, name: String, rating: Int) {
        friend.name = name
        friend.rating = rating
        saveToPersistentStore()
    }
    
    func delete(friend: Friend) {
        if let index = friends.index(of: friend) {
            friends.remove(at: index)
            saveToPersistentStore()
        }
        
//        OR
//        guard let index = friends.index(of: friend) else { return }
//        friends.remove(at: index)
        
        
        
    }
    
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "Friends.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.friends)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() -> [Friend] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let friends = try decoder.decode([Friend].self, from: data)
            return friends
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
    
}
