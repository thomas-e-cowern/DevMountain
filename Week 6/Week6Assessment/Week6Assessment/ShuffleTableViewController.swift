//
//  ShuffleTableViewController.swift
//  Week6Assessment
//
//  Created by Thomas Cowern New on 3/7/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ShuffleTableViewController: UITableViewController {
    @IBOutlet weak var nameTextBox: UISearchBar!
    @IBOutlet weak var shuffleButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var names: [String] = ["Steve", "John", "Bill", "Karen", "Debby", "Marion", "Betty"]
    var groupedNames: [[String]] = []
    var shuffledNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        groupedNames = groupNames(names: names)
        tableView.reloadData()
    }

    func groupNames (names: [String]) -> [[String]] {
        return names.chunked(into: 2)
    }
    
    func shuffleNames (names: [String]) -> [String] {
        var names = names
        var shuffled = [String]()
        for _ in 0..<names.count {
            let rand = Int(arc4random_uniform(UInt32(names.count)))
            shuffled.append(names[rand])
            names.remove(at: rand)
        }
        return shuffled
    }
    
    @IBAction func shuffleButtonPressed(_ sender: Any) {
        shuffledNames = shuffleNames(names: names)
        print(shuffledNames)
        groupedNames = groupNames(names: shuffledNames)
        print(groupedNames)
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        print("In addButtonPressed")
        guard let newName = nameTextBox.text else { print("😡 There was a guard return error in \(#function)"); return }
        names.append(newName)
//        print("aBP names: \(names)")
        groupedNames = groupNames(names: names)
//        print("aBP groupedNames: \(groupedNames)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        print("GN: \(groupedNames)")
        return groupedNames.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupedNames[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        cell.textLabel?.text =  groupedNames[indexPath.section][indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
