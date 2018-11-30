//
//  PlaylistsTableViewController.swift
//  PlayistiOS23
//
//  Created by Thomas Cowern New on 11/28/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class PlaylistsTableViewController: UITableViewController {

    // MARK: - Properties
    @IBOutlet weak var playlistTextField: UITextField!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // VIEW: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        if let playlistNameText = playlistTextField.text {
            PlaylistController.shared.createPlaylistWith(name: playlistNameText)
        }
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


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    

}
