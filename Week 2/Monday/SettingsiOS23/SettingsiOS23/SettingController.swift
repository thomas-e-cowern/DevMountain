//
//  SettingController.swift
//  SettingsiOS23
//
//  Created by Thomas Cowern New on 12/3/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SettingController {
    // MARK: - Properties
    
    
    // MARK: - Shared Instance
    static let shared = SettingController()
    
    // MARK: - Source of truth
    let settings: [Setting] = {
        let music = Setting(name: "Music", image: #imageLiteral(resourceName: "music"))
        let apps = Setting(name: "Apps", image: #imageLiteral(resourceName: "music"))
        let updates = Setting(name: "Updates", image: #imageLiteral(resourceName: "music"))
        let books = Setting(name: "Books", image: #imageLiteral(resourceName: "music"))
        
        return [music, apps, updates, books]
    }()
}
