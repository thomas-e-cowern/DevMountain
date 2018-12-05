//
//  Setting.swift
//  SettingsiOS23
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    
    // MARK: - Properties
    let name: String
    let image: UIImage
    var isActive: Bool
    
    // MARK: - Initialization
    init(name: String, image: UIImage, isOn: Bool = false) {
        self.name = name
        self.image = image
        self.isActive = isOn
    }
}
