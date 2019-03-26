//
//  ShuffleTableViewController.swift
//  Week6Assessment
//
//  Created by Thomas Cowern New on 3/7/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ShuffleTableViewController: UITableViewController {
    @IBOutlet weak var nameTextBox: UISearchBar!
    @IBOutlet weak var shuffleButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var names: [String] = []
    var groupedNames: [[String]] = []
    var newGroupedNames: [[String]] = []
    var shuffledNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        groupedNames = groupNames(names: names)
        tableView.reloadData()
    }

    func groupNames (names: [String]) -> [[String]] {
        return names.chunked(into: 2)
    }
    
    func shuffleNames (names: [String]) -> [String] {
        var names = names
        var shuffled = [String]()
        for _ in 0..<names.count {
            let rand = Int(arc4random_uniform(UInt32(names.count)))
            shuffled.append(names[rand])
            names.remove(at: rand)
        }
        return shuffled
    }
    
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        shuffledNames = shuffleNames(names: names)
        print(shuffledNames)
        groupedNames = groupNames(names: shuffledNames)
        print(groupedNames)
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        print("In addButtonPressed")
        
        var newArray: [String] = []
        guard let newName = nameTextBox.text else { print("😡 There was a guard return error in \(#function)"); return }
        names.append(newName)
        print("names: \(names)")
//        print("aBP names: \(names)")
//        groupedNames = groupNames(names: names)
//        print("aBP groupedNames: \(groupedNames)")
        print(groupedNames.last?.count)
//        print(newGroupedNames.count)
        var arrayIndex: Int = 0
        arrayIndex = groupedNames.count - 1
        print("arrayIndex: \(arrayIndex)")
        
//        guard let lastGroupCount = newGroupedNames.last?.count else { return }
//        print("LGC: \(lastGroupCount)")
//        USE THIS RIGHT HERE......
        if groupedNames.count == 0 || groupedNames.last?.count == 2 {
            print("Inside newGroupedNames if")
            newArray.append(newName)
            groupedNames.append(newArray)
        } else {
            groupedNames[arrayIndex].append(newName)
        }
        
        print("NGN: \(groupedNames)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        nameTextBox.text = ""
    }
    
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
    
//    func loadFromPersistenceStore() -> [<#array name#>] {
//        do {
//            let data = try Data(contentsOf: fileURL())
//            let decoder = JSONDecoder()
//            let <#var name#> = try decoder.decode([<#array name#>].self, from: data)
//            return <#var name#>
//        } catch  {
//            print("Error: \(#function): \(error) : \(error.localizedDescription)")
//        }
//
//        return []
//    }
    
    func deleteName (section: Int, row: Int) {
        print("Inside Delete Names")
        print("Section: \(section) Row: \(row)")
        if row == 1 {
            groupedNames[section].remove(at: row)
        } else {
            groupedNames.remove(at: section)
        }
        
        print("deleteNames: \(groupedNames)")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("GN: \(groupedNames)")
        return groupedNames.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupedNames[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.text =  groupedNames[indexPath.section][indexPath.row]
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            deleteName(section: indexPath.section, row: indexPath.row)
//            print("IPS: \(indexPath.section)")
//            print("IPR: \(indexPath.row)")
//            let section = indexPath.section
//            let row = indexPath.row
//            print(groupedNames[section][row])
//            groupedNames[indexPath.section].remove(at: indexPath.row)  *************
//            print(groupedNames)
//            groupedNames = groupNames(names: names)
            
            // Delete the row from the data source
//            print("IPS: \(indexPath.section)")
//            print("IPR: \(indexPath.row)")
//            groupedNames.remove(at: [indexPath.section][indexPath.row])

            tableView.reloadData()
//            print(groupedNames)
//            print("IP: \(indexPath.section)")
//            let indexPath = IndexPath(item: indexPath.row, section: indexPath.section)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}



extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
