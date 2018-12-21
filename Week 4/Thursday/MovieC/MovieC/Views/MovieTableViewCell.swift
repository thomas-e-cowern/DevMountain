//
//  MovieTableViewCell.swift
//  MovieC
//
//  Created by Thomas Cowern New on 12/20/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieSummaryLabel: UILabel!
    @IBOutlet weak var moviePosterImsge: UIImageView!
    
    var movie: TECMovie? {
        didSet {
            updateViews()
        }
    }
    
    var poster: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let movie = movie else { return }
        DispatchQueue.main.async {
            self.movieTitleLabel.text = movie.title
            self.movieRatingLabel.text = "Rating: \(Int(movie.rating))"
            self.movieSummaryLabel.text = movie.summary
            self.moviePosterImsge.image = self.poster
        }
    }
    
}
