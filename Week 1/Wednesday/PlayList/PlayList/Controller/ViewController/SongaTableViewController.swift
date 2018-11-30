//
//  SongaTableViewController.swift
//  PlayList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SongaTableViewController: UITableViewController {
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistnameTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = playlist?.name
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        if let songName = songNameTextField.text, let artistName = artistnameTextField.text, let playlist = playlist {
        SongController.createNewSong(songName: songName, artistName: artistName, playlist: playlist)
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs.count	?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        // Configure the cell...
        if let song = playlist?.songs[indexPath.row] {
            cell.textLabel?.text = song.name
            cell.detailTextLabel?.text = song.artist
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let playlist = playlist {
                let song = playlist.songs[indexPath.row]
                PlaylistController.shared.remove(song: song, fromPlaylist: playlist)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
