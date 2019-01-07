//
//  CocktailController.swift
//  BoozeHound
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class CocktailController {
    
    // MARK: - Protperties
    static let baseUrl = URL(string: "https://www.thecocktaildb.com/api/json/v1/1")
    
    // Full url should be: https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka
    
    // MARK: - Fetching data from the API
    static func fetchCocktailResults(with searchTerm: String, completion: @escaping ([Cocktail]?) -> Void) {
        // URL
        guard var url = baseUrl else {
            completion([])
            return
        }
        
        // Putting the url together
        url.appendPathComponent("filter.php")
        
        // Break out the path components
        var compenents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the query for the database
        let nameQueryLetter = URLQueryItem(name: "i", value: searchTerm)
        
        // Add queries to the query array
        compenents?.queryItems = [nameQueryLetter]
        
        // Build the final url
        guard let finalUrl = compenents?.url else {
            completion([])
            return
        }
        
        // Build the request using default values for GET and Body
        let request = URLRequest(url: finalUrl)
        
        
        print(finalUrl)
        
        // Making the fetch call
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // check if the call fails
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
                return
            }
            
            // Checking data
            guard let data = data else {
                completion([])
                return
            }
            
            // parsing the data
            let jsonDecoder = JSONDecoder()
                do {
                    let cocktailService = try jsonDecoder.decode(CocktailResults.self, from: data)
                    let cocktails = cocktailService.cocktailResults
                    
                    completion(cocktails)
                } catch {
                    print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                    completion([])
                    return
                }
            }.resume()
    }
    
    // MARK: - Fetching cocktail image
    static func fetchCocktailImage(_ cocktail: Cocktail, completion: @escaping ((UIImage?)) -> Void) {
        
        // setting up the url for the drink image
        guard let cocktailPictureUrl = URL(string: cocktail.picture) else { print("Error \(#function)"); return }
        
        // start the data task
        URLSession.shared.dataTask(with: cocktailPictureUrl) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
//            print("Response: \(response)")
            // Check to see if the data is good
            guard let cocktailPictureData = data else {
                completion(nil)
                return
            }
            
            // Change the data into UIImage
            let image = UIImage(data: cocktailPictureData)
            completion(image)
        }.resume()
 
    }
}
