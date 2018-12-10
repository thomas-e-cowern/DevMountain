//
//  Deck+Card.swift
//  DrawACard
//
//  Created by Thomas Cowern New on 12/8/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct Deck: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let image: String
    let value: String
    let suit: String
    let code: String
}
