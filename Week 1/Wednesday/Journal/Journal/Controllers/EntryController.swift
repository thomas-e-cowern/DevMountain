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
    static let shared = EntryController()
    
    // MARK: - Source of truth
    var entries: [Entry] = []
    
    // MARK: - CRUD
    func addEntryWith(title: String, text: String) {
        let entry = Entry(title: title, text: text)
        entries.append(entry)
    }
    
    func remove(entry: Entry) {
        if let indexOfEntry = entries.index(of: entry) {
            entries.remove(at: indexOfEntry)
        }
    }
    
    func update(entry: Entry, title: String, text: String) {
        if let indexOfEntry = entries.index(of: entry) {
            entries[indexOfEntry].title = title
            entries[indexOfEntry].text = text
        }
        
    }
}
