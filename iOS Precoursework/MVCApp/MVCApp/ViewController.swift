//
//  ViewController.swift
//  MVCApp
//
//  Created by Thomas Cowern New on 10/14/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpAboutMe()
    }

    func setUpAboutMe() {
        let thomas = Person(name: "Thomas Cowern", title: "Aspiring iOS Developer", age: 51, profilePicture: UIImage(named: "thomas-cowern")!, bio: "I am a retired USAF Explosive Ordnance Disposal Technician, and aspiring iOS developer.  After retirement, I attended an Web Development Bootvcamp in Boulder Colorado before moving to Charlotte NC, where I worked as a freelance Web Developer and pursued my own projects.  I spend free time riding my Motorcycle, enjoying movies, and reading.")
        
        nameLabel.text = thomas.name
        titleLabel.text = thomas.title
        ageLabel.text = String(thomas.age)
        image.image = thomas.profilePicture
        bioLabel.text = thomas.bio
    }

}

