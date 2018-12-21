//
//  MovieDetailViewController.swift
//  MovieSearchObjC
//
//  Created by Thomas Cowern New on 12/21/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: - Properties
    // outlets
 
    @IBOutlet weak var movieDetailTitle: UILabel!
    @IBOutlet weak var movieDetailRating: UILabel!
    @IBOutlet weak var movieDetailSummary: UILabel!
    @IBOutlet weak var movieDetailPoster: UIImageView!
    
    // movie landingpad
    var movie: TECMovie?
    
    // poster landingpad
    var poster: UIImage?
    
    // lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // updating the outlets with movie details and poster
        movieDetailTitle.text = movie?.title
        movieDetailRating.text = "Rating: \(Int(truncating: movie?.rating ?? 0))"
        movieDetailSummary.text = movie?.summary
        movieDetailPoster.image = poster
    }
}
