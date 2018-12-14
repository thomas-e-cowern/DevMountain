//
//  AppStoreItem.swift
//  AppleSearch
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct AppStoreItem {
    let title: String
    let subtitle: String
    let imageUrl: String?
    
    enum itemType: String {
        case app = "software"
        case song = "musicTrack"
    }
}

extension AppStoreItem {
    
    init?(itemType: AppStoreItem.itemType, dict: [String : Any]) {
        
        let imageUrl = dict["artworkUrl100"] as? String
        
        if itemType == .app {
            guard let title = dict["trackName"] as? String,
                let subtitle = dict["description"] as? String else { return nil }
            
            self.title = title
            self.subtitle = subtitle
            self.imageUrl = imageUrl
            
        } else if itemType == .song {
            guard let title = dict["artistName"] as? String,
                let subtitle = dict["trackName"] as? String else { return nil }
            
            self.title = title
            self.subtitle = subtitle
            self.imageUrl = imageUrl
            
        } else {
            print("Other items not avialable")
        }
        
        return nil
    }
}
