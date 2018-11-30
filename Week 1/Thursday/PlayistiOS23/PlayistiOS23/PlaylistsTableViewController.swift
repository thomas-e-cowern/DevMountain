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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // VIEW: - Actions
    fileprivate func addPlayListToTableView() {
        if let playlistNameText = playlistTextField.text {
            PlaylistController.shared.createPlaylistWith(name: playlistNameText)
            tableView.reloadData()
            playlistTextField.text = ""
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addPlayListToTableView()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.numberOfSongs)"
        return cell
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlistToDelete = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlistToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlaylistSongs" {
            let destinationVC = segue.destination as? SongsTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let playlistThatTheUserClickedOn = PlaylistController.shared.playlists[indexPath.row]
            destinationVC?.playListLandingPad = playlistThatTheUserClickedOn

        }
    }
    

}
