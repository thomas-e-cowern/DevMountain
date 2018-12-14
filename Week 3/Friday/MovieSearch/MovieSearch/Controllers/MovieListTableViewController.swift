//
//  MovieListTableViewController.swift
//  MovieSearch
//
//  Created by Thomas Cowern New on 12/14/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    // MARK: - Properties
    var movies: [Movie] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
}

// MARK: - Extensions
extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchItem = searchBar.text ?? ""
        
        MovieController.fetchMovieResults(with: searchItem) { (movies) in
            guard let fetchedMovies = movies else { return }
            self.movies = fetchedMovies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
