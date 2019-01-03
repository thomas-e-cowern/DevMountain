//
//  MessageListTableViewController.swift
//  BulletinBoard
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MessageListTableViewController: UITableViewController {

    @IBOutlet weak var bulletinBoardSearchBar: UISearchBar!
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MessageController.shared.fetchAllMessagesFromCloudKit { (messages) in
            DispatchQueue.main.async {
                guard let messages = messages else { return }
                self.messages = messages
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func BulletinBoardPostClicked(_ sender: Any) {
        postMessageFromSearchBar()
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = message.timestamp.asPrettyString
        return cell
    }
    
    func postMessageFromSearchBar() {
        guard let text = bulletinBoardSearchBar.text, !text.isEmpty else { return }
        MessageController.shared.saveMessageToCloudKit(text: text) { (message) in
            DispatchQueue.main.async {
                guard let message = message else { return }
                self.messages.append(message)
                self.tableView.reloadData()
            }
        }
    }
}
