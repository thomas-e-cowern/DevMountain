//
//  PersonTableViewController.swift
//  AboutMeWithSegue
//
//  Created by Thomas Cowern New on 11/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        // This is called when the view has loaded
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // I want the number of rows in my section to be equal to the count of people I've created
        return PersonController.shared.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // I want to make sure the cells in my Tableview are a personCell, and not a default UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        // Now I need a person to populate that cell. I can have the cells row number match the location of that person in my array. I.E. The first person in my array will be placed on the first cell of my TableView
        let person = PersonController.shared.people[indexPath.row]
        // Now set the name from that person Object to the text on the textfield
        cell.textLabel?.text = person.name
        // Now that I have configured the cell to my will. Populate the tableView with it
        return cell
        
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            
            let destinationVC = segue.destination as! DetailViewController
            
            guard let index = tableView.indexPathForSelectedRow else {return}
            
            let person = PersonController.shared.people[index.row]
            
            destinationVC.person = person
        }
    }
}
