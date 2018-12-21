//
//  MovieTableViewCell.swift
//  MovieSearchObjC
//
//  Created by Thomas Cowern New on 12/21/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Properties
    // outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLable: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var moviePosterVIew: UIImageView!

    // landing pad for the movie
    var movie: TECMovie? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Methods
    // function to update the movie view
    func updateViews() {
        // checking the movie info
        guard let movie = movie else { return }
        
        // fetching the movie poster
        TECMovieController.fetchPoster(with: movie) { (poster) in
            DispatchQueue.main.async {
                self.moviePosterVIew.image = poster
            }
            
        }
        
        DispatchQueue.main.async {
            self.movieTitleLabel.text = movie.title
            self.movieRatingLable.text = "Rating: \(Int(truncating: movie.rating))"
            self.movieSummaryLabel.text = movie.summary
        }
    }
}
