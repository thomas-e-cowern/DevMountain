//
//  StudentTableViewController.swift
//  StudentList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {

    let studentController = StudentController()
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.studentController.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)

        let student = self.studentController.students[indexPath.row]
        cell.textLabel?.text = student.firstName

        return cell
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetailSegue" {
            guard let tappedIndexPath = tableView.indexPathForSelectedRow else { return }
            let student = self.studentController.students[tappedIndexPath.row]
            if let detailVC = segue.destination as? StudentDetailViewController {
                detailVC.student = student
            }
            
        }
    }
    

}
