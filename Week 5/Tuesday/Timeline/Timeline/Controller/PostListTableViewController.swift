//
//  PostListTableViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    // MARK: - Properties
    @IBOutlet weak var postSearchBar: UISearchBar!
    
    var resultsArray: [SearchableRecord] = []
    
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        resultsArray = PostController.shared.posts
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching == true {
            return resultsArray.count
        } else {
            return PostController.shared.posts.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isSearching == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as? PostTableViewCell
            guard let post = resultsArray[indexPath.row] as? Post else { return UITableViewCell() }
            cell?.postImageView.image = post.photo
            cell?.postaptionLabel.text = post.caption
            cell?.postCommentCount.text = "Comments: \(post.comments.count)"
            return cell ?? UITableViewCell()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postsCell", for: indexPath) as? PostTableViewCell
            let post = PostController.shared.posts[indexPath.row]
            cell?.postImageView.image = post.photo
            cell?.postaptionLabel.text = post.caption
            cell?.postCommentCount.text = "Comments: \(post.comments.count)"
            return cell ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destinationVC = segue.destination as? PostDetailTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let post = PostController.shared.posts[indexPath.row]
                    destinationVC.post = post
                }
            }
        }
    }
}

extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let posts = PostController.shared.posts
        let matchingPosts = posts.filter {
            $0.matches(searchTerm: searchText)
            }.compactMap { $0 as SearchableRecord }
        resultsArray = matchingPosts
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsArray = PostController.shared.posts
        searchBar.text = ""
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
}
