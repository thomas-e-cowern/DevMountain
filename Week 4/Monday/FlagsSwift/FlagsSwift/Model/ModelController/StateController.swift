//
//  StateController.swift
//  FlagsSwift
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class StateController {
    
    static var shared = StateController()
    
    var states: [State] = []
    
    init() {
        self.states = createAllStates()
    }
    
    func createAllStates() -> [State] {
        
        var stateArrayToReturn: [State] = []
        
        for stateFullName in StateHelper.states {
            guard let index = StateHelper.states.index(of: stateFullName) else { return [] }
            
            let abbreviation = StateHelper.abbreviations[index]
            
            let state = State(name: stateFullName, abbreviation: abbreviation)
            
            stateArrayToReturn.append(state)
        }
        return stateArrayToReturn
    }
}
