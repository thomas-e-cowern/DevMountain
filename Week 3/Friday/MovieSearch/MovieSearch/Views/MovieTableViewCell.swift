//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Thomas Cowern New on 12/14/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var moviePosterView: UIImageView!
    
    // landing pad for data
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    
    // keeping view updatedWayneW
    func updateViews() {
        // Showing the movie info
        guard let movie = movie else { return }
        
        // Fetching the movie poster
        MovieController.getMoviePoster(movie) { (image) in
            DispatchQueue.main.async {
                self.moviePosterView.image = image
            }
        }
        
        // Updating the view:
        DispatchQueue.main.async {
            self.movieRatingLabel.text = "Rating: \(movie.rating)"
            self.movieTitleLabel.text = movie.title
            self.movieSummaryLabel.text = movie.summary
        }
    }
}
