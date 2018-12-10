//
//  DeckController.swift
//  DrawACard
//
//  Created by Thomas Cowern New on 12/8/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import UIKit

class DeckController {
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    static func drawOneCard() -> Card? {
        guard let url = baseURL else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            let jsonDecoder = JSONDecoder()
            let deck = try jsonDecoder.decode(Deck.self, from: data)
            return deck.cards.first
        } catch {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
        
        return nil
    }
    
    static func getImage(_ cardImageURL: String) -> UIImage? {
        guard let urlForImage = URL(string: cardImageURL) else { return nil }
        let imageData = try! Data(contentsOf: urlForImage)
        let image = UIImage(data: imageData)
        return image
    }
}
