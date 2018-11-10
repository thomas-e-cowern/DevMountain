//
//  Vampire.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class  Vampire: Monster {
    
    var vampires: [Int] = []
    
    override func terrorizeTown() {
        
        vampires.append(1)
        
        if let startPopulation = town?.population {
            if startPopulation >= 1 {
                town?.changePopulation(by: -1)
            }
        }
        
        super.terrorizeTown()
    }
}
