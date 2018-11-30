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
    
    var playListLandingPad: Playlist?
    
    // MARK: - Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    @IBAction func addSongButtonTapped(_ sender: Any) {
        addSongToTableView()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playListLandingPad?.numberOfSongs ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = playListLandingPad?.songs[indexPath.row]
        cell.textLabel?.text = song?.name
        cell.detailTextLabel?.text = song?.artist
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let unwrappedPlatListToDelete = playListLandingPad else { return }
            let songToDelete = unwrappedPlatListToDelete.songs[indexPath.row]
            SongController.shared.delete(song: songToDelete, from: unwrappedPlatListToDelete)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func addSongToTableView() {
        guard artistNameTextfield.text != "",
            songNameTextfield.text != "",
            let songName = songNameTextfield.text,
            let artistName = artistNameTextfield.text,
            let playListFromLandingPad = playListLandingPad else { return }
        SongController.shared.createSong(name: songName, artist: artistName, playlist: playListFromLandingPad)
        tableView.reloadData()
        artistNameTextfield.text = ""
        songNameTextfield.text = ""
    }
    
}
