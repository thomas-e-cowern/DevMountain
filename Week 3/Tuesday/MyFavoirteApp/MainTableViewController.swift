//
//  MainTableViewController.swift
//  MyFavoirteApp
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var appTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PersonController.getPeople { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                } 
            } else {
                
            }
        }
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let favoriteApp = appTextField.text, favoriteApp != "" else {
                return
        }
        
        PersonController.postPerson(name: name, favoriteApp: favoriteApp) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PersonController.shared.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        let person = PersonController.shared.people[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = person.favoriteApp
        
        return cell
    }
}
