//
//  EntryListTableViewController.swift
//  Journal2
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalEntries", for: indexPath)
        let journalEntry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = journalEntry.title
        cell.detailTextLabel?.text = "\(journalEntry.timeStamp)"
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toJournalEntry" {
            if let destinationVC = segue.destination as? EntryDetailViewController {
                guard let index = tableView.indexPathForSelectedRow else { return }
                let entry = EntryController.shared.entries[index.row]
                print(entry.title)
                destinationVC.entry = entry
            }
        }
    }

}
