//
//  SolarSystemTableViewController.swift
//  SolarSystem
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class PlanetListViewController: UITableViewController {
    
    let planets = PlanetController.planets

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
      // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerImage = UIImage(named: "universe")
        let headerView = UIImageView(image: headerImage)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return planets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetList") else { return UITableViewCell() }
        let planet = planets[indexPath.row]
        let planetNumber = indexPath.row + 1
        cell.textLabel?.text = planet.name
        cell.detailTextLabel?.text = "Planet \(planetNumber)"
        cell.imageView?.image = UIImage(named: "\(planet.imageName)")
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        // reuseIdentifier is "toPlanetDetail"
        if segue.identifier == "toPlanetDetail" {
            if let destinationVC = segue.destination as? PlanetDetailViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                let planet = planets[indexPath.row]

                destinationVC.planet = planet
            }
        }
    }
    

}
