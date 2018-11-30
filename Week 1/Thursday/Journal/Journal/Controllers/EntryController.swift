//
//  EntryController.swift
//  Journal
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - propertiess
    let shared = EntryController()
    
    // MARK: - Source of truth
    var entries: [Entry] = []
    
    // MARK: - CRUD
    func addEntryWith(title: String, text: String) {
        let entry = Entry(title: title, text: text)
        entries.append(entry)
        print(entries.count)
    }
    
    func remove(entry: Entry) {
        if let indexOfEntry = entries.index(of: entry) {
            entries.remove(at: indexOfEntry)
        }
    }
    
    func update(entry: Entry, title: String, text: String) {
        entry.title = title
        entry.text = text
    }
 
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "Journal.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.entries)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() -> [Entry] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let savedEntries = try decoder.decode([Entry].self, from: data)
            return savedEntries
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
}


