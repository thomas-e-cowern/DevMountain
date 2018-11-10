//
//  Monster.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Monster {
    
    static let isTerrifying = true
    
    class var spookyNoise: String {
        return "Grrr"
    }
    
    var town: Town?
    var name: String
    var mayor =  Mayor()
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    init?(town: Town?, monsterName: String) {
        guard monsterName != "" else {
            return nil
        }
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
            mayor.printMayorsMessage()
            
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
