//
//  SongsTableViewController.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {

    // MARK: - Properties
    @IBOutlet weak var artistNameTextfield: UITextField!
    @IBOutlet weak var songNameTextfield: UITextField!
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addSongButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }

}
