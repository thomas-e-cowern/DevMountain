//
//  NamesListTableViewController.swift
//  Week6PracticeAssessment
//
//  Created by Thomas Cowern New on 3/22/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class NamesListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchField: UISearchBar!
    var groupedNames: [[Name]] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Methods
    func updateViews () {
        groupedNames = NameController.shared.groupedNames
        print("grouped names: \(groupedNames.count)")
        tableView.reloadData()
    }
    
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        guard let name = searchField.text else { print("😡 There was a guard return error in \(#function)"); return }
        searchField.text = ""
        NameController.shared.addName(name: name)
        updateViews()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
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
        cell.textLabel?.text =  groupedNames[indexPath.section][indexPath.row].name
        return cell
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            NameController.shared.removeName(groupNames: groupedNames, section: indexPath.section, row: indexPath.row)
//            let indexPath = IndexPath(item: indexPath.row, section: indexPath.section)
//            print(indexPath)
////            updateViews()
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}
