//
//  PokemonCardController.swift
//  PPokeCardsiOS23keCardsiOS23
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PokemonCardController {
    
    // MARK: - Properties
    static let baseUrl = URL(string: "https://api.pokemontcg.io/")
    
    // MARK: - Fetching data from API
    // https://api.pokemontcg.io/v1/cards?name=pikachu
    static func fetchPokemonCards(with searchTerm: String, completion: @escaping ([PokemonCard]?) -> Void) {
        // URL
        guard var url = baseUrl else {
            completion(nil)
            return
        }
        // Construct url by appending path components
        url.appendPathComponent("v1")
        url.appendPathComponent("cards")
        
        // Identify url components for adding queries
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Define the queries
        let nameQueryItem = URLQueryItem(name: "name", value: searchTerm)
        
        // Add the queries to the queryItems array
        components?.queryItems = [nameQueryItem]
        
        // Rebuild the url from all needed components
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }

        print("🍔   \(finalUrl)   🍔")
        
        // Build the request
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // DataTask + Resume
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the error first
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            // Check the data
            guard let data = data else {
                completion(nil)
                return
            }
            
            // Initialize the json decoder
            let jsonDecoder = JSONDecoder()
            
            // Try to decode the top level dicionaray, return it if successful and handle any errors that may occur
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let cards = topLevelDictionary.cards
                completion(cards)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
        }.resume()
    }
    
    static func fetchPokemonImage(with card: PokemonCard, completion: @escaping (UIImage?) -> Void) {
        let cardImageUrl: URL = card.imageUrl 
        print("\(cardImageUrl)")
        
        var request = URLRequest(url: cardImageUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (imageData, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let imageData = imageData else {
                completion(nil)
                return
            }
            
            guard let cardImage = UIImage(data: imageData) else {
                completion(nil)
                return
            }
            completion(cardImage)
        }.resume()
    }
}
