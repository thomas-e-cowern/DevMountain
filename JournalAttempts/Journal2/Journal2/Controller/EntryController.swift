//
//  EntryController.swift
//  Journal2
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    func addEntryWith(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
    }
    
    func remove(remove index: Int) {
       entries.remove(at: index)
    }
    
    func update(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
    }
    
}
