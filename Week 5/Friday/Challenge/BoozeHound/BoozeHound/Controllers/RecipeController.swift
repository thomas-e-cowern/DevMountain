//
//  RecipeController.swift
//  BoozeHound
//
//  Created by Thomas Cowern New on 1/5/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class RecipeController {
    
    // MARK: - Protperties
    static let baseUrl = URL(string: "https://www.thecocktaildb.com/api/json/v1/1")
    
    // Full url should be: https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=13060
    
    // MARK: - fetching recipe data from API
    static func fetchRecipeInfo(with ID: String, completion: @escaping (RecipeResults?) -> Void) {
        
        // URL
        guard var url = baseUrl else {
            completion(nil)
            return
        }
        
        // Put the url together
        url.appendPathComponent("lookup.php")
        
        // Break out path components
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the query for the database
        let recipeQueryLetter = URLQueryItem(name: "i", value: ID)
        
        // Add queries to query array
        components?.queryItems = [recipeQueryLetter]
        
        // Build final url
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }
        
        print("Recipe Url: \(finalUrl)")
        // Building requeast using default values for get and body
        let request = URLRequest(url: finalUrl)
        
        // Making the fetch call for the recipe
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if call fails
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
        
            // Checking data
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Checking the data
            let jsonDecoder = JSONDecoder()
            do {
                let recipeResults = try jsonDecoder.decode(RecipeResults.self, from: data)
//                let recipe = recipeResults
                completion(recipeResults)
            } catch {
                    print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                    completion(nil)
                    return
            }
        }.resume()
    }
}
