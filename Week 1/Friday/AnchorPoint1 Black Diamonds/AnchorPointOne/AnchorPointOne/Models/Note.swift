//
//  Note.swift
//  AnchorPointOne
//
//  Created by Thomas Cowern New on 11/30/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Note: Equatable, Codable {
    
    // MARK: - Properties
    var text: String
    
    // MARK: - Initializers
    init(text: String) {
        self.text = text
    }
    
    // MARK: - Equatable
    static func == (lhs: Note, rhs: Note) -> Bool {
        if lhs.text == rhs.text {
            return true
        } else {
            return false
        }
    }
}
