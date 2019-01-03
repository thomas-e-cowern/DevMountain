//
//  Post.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class Post: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        if  caption.lowercased().contains(searchTerm.lowercased()){
            return true
        } else {
            return false
        }
    }
    
    var photoData: Data?
    var timestamp: Date
    var caption: String
    var comments: [Comment]
    
    var photo: UIImage? {
        get{
            guard let photoData = photoData else {return nil}
            return UIImage(data: photoData)
        }
        set{
            photoData = newValue?.jpegData(compressionQuality: 0.6)
        }
    }
    
    init(photo: UIImage, timestamp: Date = Date(), caption: String, comments: [Comment]) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
}
