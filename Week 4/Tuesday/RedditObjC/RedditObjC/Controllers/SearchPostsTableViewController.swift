//
//  SearchPostsTableViewController.swift
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class SearchPostsTableViewController: UITableViewController, UISearchBarDelegate {
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    var posts: [TECPost]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        TECPostController.shared().searchForPost(withSearchTerm: searchText.lowercased()) { (posts, error) in
            if error == nil{
                self.posts = posts
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.title = searchText
                }
            } else {
                print("😡 There was an error in \(#function)")
            }
        }
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = posts?[indexPath.row]
        cell.post = post
        return cell
    }
}
