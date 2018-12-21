//
//  MovieTableViewController.swift
//  MovieSearchObjC
//
//  Created by Thomas Cowern New on 12/21/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    // MARK: - Properties
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [TECMovie] = [];
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the searchBar delegate
        movieSearchBar.delegate = self
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
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // get title and check the search bar isn't empty
        guard let title = movieSearchBar.text, !title.isEmpty else { return }
        
        // make to query request
        TECMovieController.fetchAllMovies(withTitle: title) { (movies) in
            
            // check to make sure there are movies
            guard let movies = movies else { return }
            
            // send the movies to populate the table
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
        
    }
}
