//
//  ContactListTableViewController.swift
//  Contacts
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isSearching: Bool = false
    
    var resultsArray: [SearchableRecord] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        ContactController.shared.fetchContacts { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        resultsArray = ContactController.shared.contacts
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // determing rows returned based on searching
        if isSearching == true {
            return resultsArray.count
        } else {
            return ContactController.shared.contacts.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            guard let contact = resultsArray[indexPath.row] as? Contact else { return UITableViewCell() }
            cell.textLabel?.text = contact.name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            let contact = ContactController.shared.contacts[indexPath.row]
            cell.textLabel?.text = contact.name
            return cell
        }
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = ContactController.shared.contacts[indexPath.row]
            ContactController.shared.deleteContact(contact: contact) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditView" {
            if let destinationVC = segue.destination as? ContactDetialViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                let contact = ContactController.shared.contacts[indexPath.row]
                destinationVC.contact = contact
            }
        }
    }
    
    
}

// MARK: - Search Functionality
extension ContactListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let contacts = ContactController.shared.contacts
        let matchingContacts = contacts.filter {
            $0.matches(searchTerm: searchText)
            }.compactMap { ($0 as SearchableRecord) }
        resultsArray = matchingContacts
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsArray = ContactController.shared.contacts
        searchBar.text = ""
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
}
