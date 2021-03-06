//
//  Zombie.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class  Zombie: Monster {
    var walkWithLimp = true
    
    override func terrorizeTown() {
        
        if let startPopulation = town?.population {
            if startPopulation >= 10 {
                town?.changePopulation(by: -10)
            }
        }
        
        super.terrorizeTown()
    }
}
