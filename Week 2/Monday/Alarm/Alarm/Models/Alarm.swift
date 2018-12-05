//
//  Alarm.swift
//  Alarm
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Alarm: Equatable, Codable {

    var fireDate: Date
    var name: String
    var enabled: Bool
    let uuid: String
    var fireTimeAsString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: fireDate)
        }
    }
    
    init(fireDate: Date, name: String, enabled: Bool) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        self.uuid = UUID().uuidString
    }
    
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.uuid == rhs.uuid { return true }
        return false
    }
    
}
