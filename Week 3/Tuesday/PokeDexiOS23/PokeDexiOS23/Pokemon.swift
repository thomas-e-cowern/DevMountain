//
//  Pokemon.swift
//  PokeDexiOS23
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    let id: Int
    let name: String
    let abilities: [AbilityWrapper]
    let sprites: Sprites
}

struct Sprites: Decodable {
    
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "front_shiny"
        
    }
}

struct AbilityWrapper: Decodable {
    
    let ability: Ability
    
}

struct Ability: Decodable {
    
    let name: String
    
}
