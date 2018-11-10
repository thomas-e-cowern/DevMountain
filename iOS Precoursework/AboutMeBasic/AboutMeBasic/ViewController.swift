//
//  ViewController.swift
//  AboutMeBasic
//
//  Created by Thomas Cowern New on 8/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var imageLabel: UIImageView!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    func setUpAboutMe() {
        nameLabel.text = "Thomas Cowern"
        titleLabel.text = "Aspiring iOS developer"
        ageLabel.text = "Age: 51"
        imageLabel.image = UIImage(named: "thomas-cowern")
        bioLabel.text = "I am a retired USAF Explosive Ordnance Disposal technician and web developer.  I have been interested in developing applications for all mac devices since I got my first macbook pro in 2009."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpAboutMe()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

