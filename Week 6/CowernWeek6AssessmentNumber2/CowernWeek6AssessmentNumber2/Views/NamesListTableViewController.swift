//
//  NamesListTableViewController.swift
//  CowernWeek6AssessmentNumber2
//
//  Created by Thomas Cowern New on 3/26/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class NamesListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameSearchBar: UISearchBar!
    
    // MARK: - Properties
    var groupedNames: [[Names]] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - Methods
    // Update views when data changes
    func updateViews () {
        groupedNames = NamesController.shared.groupedNames
        tableView.reloadData()
    }
    
    // MARK: - Actions
    // Randomizes the list of names
    @IBAction func randomizeButtonPressed(_ sender: Any) {
        let flatNames = groupedNames.flatMap { $0 }
        let shuffledNames = NamesController.shared.shuffleNames(names: flatNames)
        groupedNames = shuffledNames.chunked(into: 2)
        NamesController.shared.saveToPersistentStore()
        tableView.reloadData()
    }
    
    // Adds a new name to the array
    @IBAction func addNameButtonPressed(_ sender: Any) {
        guard let name = nameSearchBar.text else { print("😡 There was a guard return error in \(#function)"); return }
        NamesController.shared.addName(name: name)
        nameSearchBar.text = ""
        updateViews()
    }
    
    // MARK: - Table view data source
    // Setting the number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedNames.count
    }

    // Setting the title for each section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    // Setting the rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupedNames[section].count
    }
    
    // Assigning the name to each row of each section
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        let name = groupedNames[indexPath.section][indexPath.row].name
        cell.textLabel?.text = name[0][0]
        return cell
    }

    // Removing a name from the array
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            NamesController.shared.removeName(groupNames: groupedNames, section: indexPath.section, row: indexPath.row)
            updateViews()
        }
    }
}
