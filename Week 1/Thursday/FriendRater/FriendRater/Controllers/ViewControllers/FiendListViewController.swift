//
//  ViewController.swift
//  FriendRater
//
//  Created by Thomas Cowern New on 11/29/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class FiendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        FriendController.shared.friends = FriendController.shared.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FriendController.shared.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        
        let friend = FriendController.shared.friends[indexPath.row]
        
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = "\(friend.rating)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editFriendSegue" {
            if let destinationVC = segue.destination as? FriendDetailViewController{
                guard let index = tableView.indexPathForSelectedRow else { return }
                let friend = FriendController.shared.friends[index.row]
                destinationVC.friend = friend
                
            }
        }
    }
}

