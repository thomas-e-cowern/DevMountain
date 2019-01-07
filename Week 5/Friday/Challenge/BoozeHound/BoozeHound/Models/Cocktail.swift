//
//  Cocktail.swift
//  BoozeHound
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

struct CocktailResults: Codable {
    
    let cocktailResults: [Cocktail]
    
    enum CodingKeys: String, CodingKey {
        case cocktailResults = "drinks"
    }
    
}

struct CocktailBucket {
    let name: String
    let id: String
    let image: UIImage
    
    init(name: String, id: String, image: UIImage) {
        self.name = name
        self.id = id
        self.image = image
    }
}

struct Cocktail: Codable {
    let name: String
    let picture: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strDrink"
        case picture = "strDrinkThumb"
        case id = "idDrink"
    }
    
    init(name: String, picture: String, id: String) {
        self.name = name
        self.picture = picture
        self.id = id
    }

}
