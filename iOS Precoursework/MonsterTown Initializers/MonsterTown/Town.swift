//
//  Town.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    
    var population: Int {
        didSet(oldPopulation) {
            print("The old population has changed to \(population) from \(oldPopulation)")
        }
    }
    
    var numberOfStoplights: Int
    
    init?(region: String, population: Int, stoplights: Int) {
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        self.numberOfStoplights = stoplights
    }
    
    init?(population: Int, stoplights: Int) {
    self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights); region: \(region)")
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
}

