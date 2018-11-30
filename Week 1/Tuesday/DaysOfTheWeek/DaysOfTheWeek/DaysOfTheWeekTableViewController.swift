//
//  DaysOfTheWeekTableViewController.swift
//  DaysOfTheWeek
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class DaysOfTheWeekTableViewController: UITableViewController {
    
    var daysOfTheWeek: [String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return daysOfTheWeek.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        let day = daysOfTheWeek[indexPath.row]
        cell.textLabel?.text = day
        return cell
    }
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
//        if segue.identifier == "toDayDetail" {
//            let destinationVC = segue.destination as? DayDetailViewController
//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
//            let day = daysOfTheWeek[indexPath.row]
//            // Pass the selected object to the new view controller.
//            destinationVC?.day = day
//        }
        
        // IIDOO
        // Identifier
        if segue.identifier == "toDayDetail" {
            // Indexpath
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            // destination veiw controller
            let desitnationVC = segue.destination as? DayDetailViewController
            // Object
            let day = daysOfTheWeek[indexPath.row]
            // Pass the object
            desitnationVC?.day = day
            
        }
        
    }
    

}
