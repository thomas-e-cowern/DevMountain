//
//  PostListTableViewController.swift
//  WhyiOS
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    // MARK: - Networking Data source
    var posts: [Post] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadPosts()
    }

    @IBAction func refreshPostButtonTapped(_ sender: Any) {
        reloadPosts()
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        self.presentAddPostAlert()
    }
    
    fileprivate func reloadPosts() {
        PostController.fetchPosts { (posts) in
            DispatchQueue.main.async {
                self.posts = posts ?? []
                self.tableView.reloadData()
            }
        }
    }
    
    func presentAddPostAlert() {
        let alertController = UIAlertController(title: "Add your reason", message: nil, preferredStyle: .alert)
        alertController.addTextField { (reasonTextField) in
            reasonTextField.placeholder = "Your reason for iOS..."
        }
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name..."
        }
        alertController.addTextField { (cohortTextField) in
            cohortTextField.placeholder = "Cohort..."
        }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addReasonAction = UIAlertAction(title: "Add Reason", style: .default) { (_) in
            guard let reason = alertController.textFields?[0].text, !reason.isEmpty,
            let name = alertController.textFields?[1].text, !name.isEmpty else { return }
            let cohort = alertController.textFields?[2].text
            
            PostController.postReason(name: name, reason: reason, cohort: cohort, completion: { (success) in
                if success {
                    self.reloadPosts()
                } else {
                    self.presentFialedToPostAlert()
                }
            })
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addReasonAction)
        self.present(alertController, animated: true)
    }
    
    func presentFialedToPostAlert() {
        let alertController = UIAlertController(title: "Failuer", message: "Due to an unforseen error, you are a loser", preferredStyle:    .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alertController, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.reason
        cell.detailTextLabel?.text = "\(post.name) - \(post.cohort ?? "")"
        return cell
    }
}
