//
//  Pokemon.swift
//  PokeDex
//
//  Created by Thomas Cowern New on 12/10/18.
//

import Foundation


struct Pokemon: Codable {
    let name: String
    let weight: Int
    let id: Int
    
    let sprites: Sprite
}

struct Sprite: Codable {
    let pokemanImageUrlAsString: String
    
    enum CodingKeys: String, CodingKey {
        case pokemanImageUrlAsString = "front_default"
    }
}
