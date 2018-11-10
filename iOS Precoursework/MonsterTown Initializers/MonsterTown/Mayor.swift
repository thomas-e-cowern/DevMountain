//
//  Mayor.swift
//  MonsterTown
//
//  Created by Thomas Cowern New on 9/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

struct Mayor {
    var decrease = "I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence."
    
    var anxietyLevel = 0 {
        didSet(oldAnxietyLevel) {
            print("The anxiety level has changed to \(anxietyLevel) from \(oldAnxietyLevel).")
        }
    }
    
    mutating func increaseAnxiety() {
        anxietyLevel = anxietyLevel + 1
    }
    
    mutating func printMayorsMessage() {
        print(decrease)
        increaseAnxiety()
    }
}
