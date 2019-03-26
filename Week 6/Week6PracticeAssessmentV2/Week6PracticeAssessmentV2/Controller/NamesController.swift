//
//  NamesController.swift
//  Week6PracticeAssessment
//
//  Created by Thomas Cowern New on 3/22/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class NameController {
    
    // MARK: - Singleton
    static let shared = NameController()
    
    // MARK: - Properties
    var names: [Name] = []
    var groupedNames: [[Name]] = []
    
    // MARK: - Initializers
    private init () {
        self.names = loadFromPersistenceStore()
        groupedNames = groupNames(names: names)
    }
    
    func updateData () {
        self.names = loadFromPersistenceStore()
        groupedNames = groupNames(names: names)
    }
    
    // MARK: - Grouping function
    func groupNames (names: [Name]) -> [[Name]] {
        return names.chunked(into: 2)
    }
    
    // MARK: - Ungrouping function
    func ungroupNames (groupedNames: [[Name]]) -> [Name] {
        return groupedNames.flatMap { $0 }
    }
    
    // MARK: - CRUD
    func addName(name: String) {
        let newName = Name(name: name)
        names.append(newName)
        groupedNames = groupNames(names: names)
        self.saveToPersistentStore()
    }
    
    func removeName (groupNames: [[Name]], section: Int, row: Int) {
        names = ungroupNames(groupedNames: groupNames)
        print(names.count)
        if section == 0 {
            names.remove(at: (section + row))
        } else {
            names.remove(at: (section + row + 1))
        }
        print(names.count)
        self.saveToPersistentStore()
        updateData()
    }
        
    // MARK: - Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "names.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(self.names)
            try data.write(to: fileURL())
        } catch {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistenceStore() -> [Name] {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let names = try decoder.decode([Name].self, from: data)
            return names
        } catch  {
            print("Error: \(#function): \(error) : \(error.localizedDescription)")
        }
        
        return []
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
