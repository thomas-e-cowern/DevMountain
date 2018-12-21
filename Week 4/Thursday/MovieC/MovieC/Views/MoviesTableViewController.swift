//
//  MoviesTableViewController.swift
//  MovieC
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [TECMovie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

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
        TECMovieController.fetchPoster(with: movie) { (poster) in
            DispatchQueue.main.async {
                cell.poster = poster
            }
        }
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

extension MoviesTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let titleSearch = searchBar.text, !titleSearch.isEmpty else {
            return
        }
        TECMovieController.fetchAllMovies(withTitle: titleSearch) { (movies) in
            let movies = movies 
            DispatchQueue.main.async {
                
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
}
