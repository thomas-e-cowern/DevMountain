//
//  EntryController.swift
//  JournalTwo
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
        if let indexToRemove = entries.index(of: entry) {
            entries.remove(at: indexToRemove)
        }
    }
    
    func update(entry: Entry, title: String, text: String) {
        if let indexToUpdate = entries.index(of: entry) {
            entries[indexToUpdate].title = title
            entries[indexToUpdate].text = text
        }
    }
}
