//
//  DateHelpers.swift
//  Task
//
//  Created by Thomas Cowern New on 12/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
        
    }
}
