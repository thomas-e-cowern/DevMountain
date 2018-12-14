//
//  Movie.swift
//  MovieSearch
//
//  Created by Thomas Cowern New on 12/14/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct MovieService: Codable {
    
    let movieResults: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movieResults = "results"
    }
    
}

struct Movie: Codable {
    let title: String
    let rating: Double
    let summary: String
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case rating = "vote_average"
        case summary = "overview"
        case poster = "poster_path"
    }
}
