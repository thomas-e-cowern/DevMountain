//
//  Town.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var mayor =  Mayor()
        
    var population = 5_422 {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    
    var numberOfStoplights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        get {
            switch self.population {
        case 0...10_000:
            return Size.small
            
        case 10_001...100_000:
            return Size.medium
            
        default:
            return Size.large
            }
            
        }
    }
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStoplights)")
    }
    
    mutating func changePopulation(by amount: Int) {
        
        if amount < 0 {
            population += amount
            mayor.printMayorsMessage()
            mayor.increaseAnxiety()
        }
    }
}
