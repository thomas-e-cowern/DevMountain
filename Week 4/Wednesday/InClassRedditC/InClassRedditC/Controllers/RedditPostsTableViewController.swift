//
//  RedditPostsTableViewController.swift
//  InClassRedditC
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class RedditPostsTableViewController: UITableViewController {
    
    var posts: [TECPost] = []

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "redditCell", for: indexPath) as! RedditPostTableViewCell
        let post = posts[indexPath.row]
        cell.post = post
        return cell
    }
}

extension RedditPostsTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        TECPostController.fetchAllPostsForSubReddit(withTitle: searchText) { (posts) in
            guard let posts = posts else { return }
            DispatchQueue.main.async {
                self.posts = posts
                self.tableView.reloadData()
            }
        }
    }
}
