//
//  ToDoList.swift
//  iTahDoodle
//
//  Created by Thomas Cowern New on 10/8/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ToDoList: NSObject, UITableViewDelegate {
    
    private let fileUrl: URL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving items to \(fileUrl)")
        
        if !itemsArray.write(to: fileUrl, atomically: true) {
            print("Coule not save the todo list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileUrl) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }
}

extension ToDoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        print(item)
    }
}
