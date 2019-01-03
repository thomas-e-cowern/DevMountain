//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var post: Post? {
        didSet{
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews() {
        photoImageView.image = post?.photo
    }
    
    @IBAction func commentButtonPressed(_ sender: Any) {
        presentCommentAlertController()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func followButtonPresses(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath)
        guard let post = post else { return UITableViewCell() }
        cell.textLabel?.text = post.comments[indexPath.row].text
        cell.detailTextLabel?.text = "\(post.comments[indexPath.row].timestamp)"
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

extension PostDetailTableViewController {
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add Comment", message: "Add a comment", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a comment"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let textField = alertController.textFields?.first else { return }
            guard var text = textField.text else { return }
            guard let post = self.post else { return }
            print("Post: \(post.comments.count)")
            PostController.shared.addComment(text: text, post: post, completion: { (comment) in
                DispatchQueue.main.async {
                    text = comment.text
                    self.tableView.reloadData()
                }
            })
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
