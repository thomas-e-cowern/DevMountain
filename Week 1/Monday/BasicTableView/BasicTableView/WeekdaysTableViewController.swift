//
//  WeekdaysTableViewController.swift
//  BasicTableView
//
//  Created by Thomas Cowern New on 11/26/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class WeekdaysTableViewController: UITableViewController {

    var weekdays: [String] = ["Monday","Tuesday","Wednesdsy","Thursday","Friday","Saturday","Sunday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weekdays.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)

        let dayOfWeek = weekdays[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = dayOfWeek
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check the segues identifier
        // Get the new view controller using segueDestinationViewController
        // Get the day of the week the user tapped on
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailView" {
            if let destinationViewController = segue.destination as? DayViewController {
                if let indexpath = tableView.indexPathForSelectedRow {
                    let day = weekdays[indexpath.row]
                    destinationViewController.day = day
                }
            }
        }
    }

}
