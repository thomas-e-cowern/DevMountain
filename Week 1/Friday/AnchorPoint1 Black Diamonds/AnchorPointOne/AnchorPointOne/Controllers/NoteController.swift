//
//  NoteController.swift
//  AnchorPointOne
//
//  Created by Thomas Cowern New on 11/30/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class NoteController {
    
    // MARK: - Singleton
    static let shared = NoteController()
    
    // MARK: - Properties
    var notes: [Note] = []

    // MARK: - Initializers
    private init() {
        self.notes = loadFromPersistenceStore()
    }
    
    // MARK: - CRUD
    func addNewNote(text: String) {
        let newNote = Note(text: text)
        notes.append(newNote)
        self.saveToPersistentStore()
    }
    
    func delete(note: Note) {
        if let index = notes.index(of: note) {
            notes.remove(at: index)
            self.saveToPersistentStore()
        }
    }
    
    func update(note: Note, text: String) {
        note.text = text
        self.saveToPersistentStore()
    }
    
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "notes.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.notes)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() -> [Note] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let notes = try decoder.decode([Note].self, from: data)
            return notes
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
}


