//
//  MovieController.swift
//  MovieSearch
//
//  Created by Thomas Cowern New on 12/14/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class MovieController: UIViewController {
    
    // MARK: - Properties
    static let baseUrl = URL(string: "https://api.themoviedb.org")
    private static let apiSecret = "d67c0e04aa9692e7d1190b230c8cca09"
    
    // What the full url should be:
    // https://api.themoviedb.org/3/search/movie?query=StarWars&api_key=d67c0e04aa9692e7d1190b230c8cca09&language=en-US&page=1&include_adult=false
    
    // MARK: - Fetching data from API
    static func fetchMovieResults(with searchTerm: String, completion: @escaping ([Movie]?) -> Void) {
        // URL
        guard var url = baseUrl else {
            completion(nil)
            return
        }
        
        // Construct the url by appending path components
        url.appendPathComponent("3")
        url.appendPathComponent("search")
        url.appendPathComponent("movie")
        
        // Break out the path components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the queries from the url example above
        let titleQueryItem = URLQueryItem(name: "query", value: searchTerm)
        let apiQueryItem = URLQueryItem(name: "api_key", value: apiSecret)
        let apiLanguageQueryItem = URLQueryItem(name: "language", value: "en-US")
        let apiAdultQuery = URLQueryItem(name: "include_adult", value: "false")
        
        // add queries to the query array
        components?.queryItems = [titleQueryItem, apiQueryItem, apiLanguageQueryItem, apiAdultQuery]
        
        // Build the final url
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }
        
        // Building the request
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Making the fetch call to the API
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // if the call fails immediately
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Checking to see if data is there
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Parsing the data into something usefull
            let jsonDecoder = JSONDecoder()
            
            do {
                let movieService = try jsonDecoder.decode(MovieService.self, from: data)
                let movies = movieService.movieResults

                completion(movies)
            } catch {
                print("😡 👎 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                
                completion(nil)
                return
            }
        }.resume()
    }
    
    // MARK: - Fetching image from the web
    static func getMoviePoster(_ movie: Movie, completion: @escaping ((UIImage?)) -> Void) {
        //Setting up the url to get the poster
        var posterBaseUrl = URL(string: "http://image.tmdb.org/t/p/w500")
        
        guard let urlForPoster = movie.poster else { return }
        
        posterBaseUrl?.appendPathComponent(urlForPoster)
        
        guard let finalPosterUrl = posterBaseUrl else { return }
 
        //Start the data taks to fetch the poster image
        URLSession.shared.dataTask(with: finalPosterUrl) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            // check to see the data is good
            guard let posterData = data else {
                completion(nil)
                return
            }
            
            // change the data into a UIImage to be displayed
            let image = UIImage(data: posterData)
            completion(image)
        }.resume()
    }
}

