//
//  Names.swift
//  Week6PracticeAssessment
//
//  Created by Thomas Cowern New on 3/22/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class Name: Equatable, Codable {
    
    // MARK: - Properties
    var name: String
    
    // MARK: - Initializer
    init(name: String) {
        self.name = name
    }
    
    // MARK: - Equatable
    static func == (lhs: Name, rhs: Name) -> Bool {
        if lhs.name == rhs.name {
            return true
        } else {
            return false
        }
    }
}
