//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Thomas Cowern New on 11/26/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var favoriteController = FavoriteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteController.favorites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoritesIdentifier") else { return UITableViewCell() }
        let favorite = favoriteController.favorites[indexPath.row]
        cell.textLabel?.text = favorite
        return cell
    }
    
}

