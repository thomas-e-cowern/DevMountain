//
//  EntryController.swift
//  JournalThree
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    
    // MARK: - Properties
    var entries: [Entry] = []
    
    // MARK: - CRUD
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry(title: title, text: text)
        entries.append(newEntry)
    }
    
    func remove(entry: Entry) {
        if let entryToRemove = entries.index(of: entry) {
            entries.remove(at: entryToRemove)
        }
    }
    
    func create(entry: Entry, title: String, text: String) {
        if let entryToUpdate = entries.index(of: entry) {
            entries[entryToUpdate].title = title
            entries[entryToUpdate].text = text
        }
    }
    
}
