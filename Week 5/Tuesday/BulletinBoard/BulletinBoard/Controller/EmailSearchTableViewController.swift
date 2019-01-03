//
//  EmailSearchTableViewController.swift
//  BulletinBoard
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class EmailSearchTableViewController: UITableViewController {
    
    @IBOutlet weak var emailSearchBar: UISearchBar!
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailSearchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emailCell", for: indexPath)
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = message.timestamp.asPrettyString
        return cell
    }
}

extension EmailSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        MessageController.shared.fetchMessagesFromUserWith(email: searchText.lowercased()) { (messages) in
            DispatchQueue.main.async {
                guard let messages = messages else { return }
                self.messages = messages
                self.tableView.reloadData()
                
            }
        }
    }
}
