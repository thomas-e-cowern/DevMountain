//
//  Person.swift
//  AboutMeWithSegue
//
//  Created by Thomas Cowern New on 11/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation
import UIKit

class Person  {
    let name: String
    var title: String
    var age: Int
    var profilePicture: UIImage
    var bio: String
    
    init(name: String, title: String, age: Int, profilePicture: UIImage, bio: String) {
        self.name = name
        self.title = title
        self.age = age
        self.profilePicture = profilePicture
        self.bio = bio
    }
}
