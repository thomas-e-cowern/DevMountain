//
//  RepresentativeController.swift
//  Representative
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    // MARK: - Base URL
    static let baseUrl = URL(string: "https://whoismyrepresentative.com")
    
    // MARK: - Search by state
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        
        // Query URL begins with base URL
        guard var url = baseUrl else {
            completion(nil)
            return
        }
        
        // Building the final URL by adding state component
        url.appendPathComponent("getall_reps_bystate.php")
        
        // Identifying components for add queries
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Queries for state
        let representativeByState = URLQueryItem(name: "state", value: state)
        
        // Queries for json return
        let jsonReturn = URLQueryItem(name: "output", value: "json")
        
        // Add the queries to the queryItems array
        components?.queryItems = [representativeByState, jsonReturn]
        
        // final url constructed from all the pieces
        guard let finalUrl = components?.url else {
            completion(nil)
            return
        }
        print(finalUrl)
        
        // Build the request
        var request = URLRequest(url: finalUrl)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            // Check for errors
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
            
            // Try to decode the top level dictionary
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let reps = topLevelDictionary.representatives
                completion(reps)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            }.resume()
    }
}
