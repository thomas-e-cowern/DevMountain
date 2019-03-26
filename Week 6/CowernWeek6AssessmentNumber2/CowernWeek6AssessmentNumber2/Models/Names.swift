//
//  Names.swift
//  CowernWeek6AssessmentNumber2
//
//  Created by Thomas Cowern New on 3/26/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class Names: Equatable, Codable {
    
    // MARK: - Properties
    var name: [[String]]
    
    // MARK: - Initializer
    init(name: String) {
        self.name = [[name]]
    }
    
    // MARK: - Equatable
    static func == (lhs: Names, rhs: Names) -> Bool {
        if lhs.name == rhs.name {
            return true
        } else {
            return false
        }
    }
}
