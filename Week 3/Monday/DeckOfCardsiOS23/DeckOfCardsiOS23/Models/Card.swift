//
//  Card.swift
//  DeckOfCardsiOS23
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let suit: String
    let value: String
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case suit
        case value
        case imageURL = "image"
    }
}
