//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {

 
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var selectImageImage: UIImageView!
    @IBOutlet weak var addCaptionText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPostTapped(_ sender: Any) {
        guard let caption = addCaptionText.text, !caption.isEmpty else { return }
        guard let image = selectImageImage.image else { return }
        
        PostController.shared.createPostWith(image: image, caption: caption) { (_) in
            print("Created post")
        }
        addCaptionText.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func selectImageTapped(_ sender: Any) {
    
//        print("selectImageButtonTapped")
//        let image = UIImage(named: "1-by-1-1024x1024")
//        selectImageImage.image = image
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

