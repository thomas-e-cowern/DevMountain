//
//  PostListViewController.swift
//  Post
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let postController = PostController()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 45
        
        PostController.fetchPosts {
            self.reloadDataView()
        }
        
        tableView.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(refreshControlPulled), for: .valueChanged)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = PostController.posts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") {
            cell.textLabel?.text = post.text
            cell.detailTextLabel?.text = "\(post.timestamp)"
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func refreshControlPulled() {
        PostController.fetchPosts {
            DispatchQueue.main.async {
                self.refreshControl.beginRefreshing()
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func reloadDataView() {
        PostController.fetchPosts {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewPostAlert()
    }
}

extension PostListViewController {
    func presentNewPostAlert() {
        // Create the alert controller
        let alertController = UIAlertController(title: "New Post", message: "Add a new post", preferredStyle: .alert)
        alertController.addTextField { (usernameTextField) in
            usernameTextField.placeholder = "Enter your username"
        }
        alertController.addTextField { (messageTextField) in
            messageTextField.placeholder = "Enter your message here..."
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let usernameTextField = alertController.textFields?.first, let messageTextField = alertController.textFields?.last {
                if usernameTextField.text != "" && messageTextField.text != "" {
                    if let username = usernameTextField.text, let message = messageTextField.text {
                        PostController.addNewPostWith(username: username , text: message, completion: {_ in
                            self.tableView.reloadData()
                        })
                    }
                }
            }
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
    
    
}
