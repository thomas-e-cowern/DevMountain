//
//  CardController.swift
//  DeckOfCardsiOS23
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import UIKit

class CardController {
    // MARK: - Properties
    static let baseUrl = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    
    
    // MARK: - Fetch function
    static func draw(numberOfCards: Int, completion: @escaping (_ cards: [Card]) -> Void) {
        // URL
        guard let url = baseUrl else { completion([]) ; return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        components?.queryItems = [cardCountQueryItem]
        guard let urlForRequest = components?.url else { completion([]) ; return }
        print(urlForRequest.absoluteString)
        
        // Request
        var request = URLRequest(url: urlForRequest)
        // Method: "GET", "POST", "PUT"
        request.httpMethod = "GET"
        // Body
        request.httpBody = nil
        // DataTask + Resume
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data else { completion([]) ;  return }
            let jsonDecoder = JSONDecoder()
            do {
                let topLevelDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: data)
                let cards = topLevelDictionary.cards
                completion(cards)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
            }
            }.resume()
    }
    
    static func getImage(for card: Card, completion: @escaping (UIImage?) -> Void) {
        // URL
        let url = card.imageURL
        print(url.absoluteString)
        
        // Request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // Data + Resume
        URLSession.shared.dataTask(with: request) { (imageData, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let imageData = imageData else { completion(nil) ; return }
            guard let cardImage = UIImage(data: imageData) else { completion(nil) ; return }
            completion(cardImage)
        }.resume()
    }
}
