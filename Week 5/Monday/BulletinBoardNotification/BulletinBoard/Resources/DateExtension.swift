//
//  DateExtension.swift
//  BulletinBoard
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation
extension Date {
    var asPrettyString: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
