//
//  EntryListTableViewController.swift
//  JournalCloudKit
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit
import CloudKit

class EntryListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.shared.fetchEntries { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteRecord(entry: entry) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //create the action
        let sharedContectualAction = UIContextualAction(style: .normal, title: "Share") { (action, view, nil) in
            print("Sharing this entry")
            // Create cloud sharing container
            let cloudSharingController = UICloudSharingController { (controller, completion: @escaping (CKShare?, CKContainer?, Error?) -> Void) in
                let entry = EntryController.shared.entries[indexPath.row]
                EntryController.shared.createShare(with: entry, completion: completion)
            }
            
            if let popover = cloudSharingController.popoverPresentationController {
                popover.backgroundColor = .yellow
            }
            
            DispatchQueue.main.async {
                self.present(cloudSharingController, animated: true)
            }
            
        }
        
        sharedContectualAction.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        let configuration = UISwipeActionsConfiguration(actions: [sharedContectualAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editEntry" {
            if let destinationVC = segue.destination as? EntryDetailViewController {
                if let indexpath = tableView.indexPathForSelectedRow {
                    let entry = EntryController.shared.entries[indexpath.row]
                    destinationVC.entry = entry
                }
            }
        }
    }
}
