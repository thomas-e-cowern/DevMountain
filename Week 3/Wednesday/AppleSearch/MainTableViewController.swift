//
//  MainTableViewController.swift
//  AppleSearch
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var itemSearchBar: UISearchBar!
    @IBOutlet weak var itemSegmentedControl: UISegmentedControl!
    
    var appStoreItems: [AppStoreItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppStoreItemController.getItemsOf(type: .song, searchText: "Hall and Oats") { (items) in
            self.appStoreItems = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appStoreItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appStoreItemCell", for: indexPath) as! ItemTableViewCell
        let appStoreItem = appStoreItems[indexPath.row]
        cell.item = appStoreItem
        
        
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
