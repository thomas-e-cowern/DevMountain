//
//  EntriesTableViewController.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = PetOwnerController.shared.loggedInPetOwner?.username ?? "Welcome"
        
        fetchEntries()
        //        EntryController.shared.createEntryWith(text: "Testing") { (success) in
        //            if success {
        //                print("Success")
        //            } else {
        //                print("Bummer")
        //            }
        //
        //        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchEntries()
    }
    
    func fetchEntries () {
        EntryController.shared.fetchEntries { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        presentEntryAlert()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = EntryController.shared.entries[indexPath.row]
            EntryController.shared.delete(entry: entry) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension EntriesTableViewController {
    func presentEntryAlert() {
        let alertController = UIAlertController(title: "Add Entry", message: "Add Entry Now", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Add entry here..."
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add Entry", style: .default) { (_) in
            guard let entryText = alertController.textFields?[0].text else { return }
            EntryController.shared.createEntryWith(text: entryText, completion: { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        
    }
}
