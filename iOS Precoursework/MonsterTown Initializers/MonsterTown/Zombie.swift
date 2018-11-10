//
//  Zombie.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class  Zombie: Monster {
    
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp: Bool
    
    private(set) var isFallingApart: Bool
    
    // silver challenge
    convenience init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        self.init(town: town, monsterName: monsterName)
        walksWithLimp = limp
        isFallingApart = fallingApart
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    } 
    
    override convenience init?(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        self.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    override func terrorizeTown() {
        
        if !isFallingApart {
            if let startPopulation = town?.population {
                if startPopulation >= 10 {
                    town?.changePopulation(by: -10)
                } else {
                    town?.population = 0
                }
            }
        }
        
        super.terrorizeTown()
    }
}
