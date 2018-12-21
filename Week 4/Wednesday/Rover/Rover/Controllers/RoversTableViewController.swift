//
//  RoversTableViewController.swift
//  Rover
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class RoversTableViewController: UITableViewController {
    
    var rovers: [TECRover]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loadButtonClicked(_ sender: Any) {
        TECMarsRoverClient.fetchAllMarsRovers { (rovers) in
            guard let fetchedRovers = rovers else { return }
            self.rovers = fetchedRovers as? [TECRover]
            DispatchQueue.main.async {
                self.title = "Rover List"
                self.tableView.reloadData()
            }

            
        }
        
    }
    func updateViews() {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let rovers = rovers else { return 0 }
        return rovers.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roverCell", for: indexPath)
        guard let rover = rovers?[indexPath.row] else { return UITableViewCell() }
        cell.textLabel?.text = rover.nameOfRover
        print(rover.nameOfRover)
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
