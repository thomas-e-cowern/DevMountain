//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // based on number of states in States.swift
        return States.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let state = States.all[indexPath.row]
            print(state)
            if segue.identifier == "toRepDetail" {
                if let destinationVC = segue.destination as? StateDetailTableViewController {
                    destinationVC.state = state
                }
            }
            
        }
    }
}
