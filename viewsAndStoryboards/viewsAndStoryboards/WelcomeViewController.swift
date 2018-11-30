//
//  WelcomeViewController.swift
//  viewsAndStoryboards
//
//  Created by Thomas Cowern New on 11/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome " + email
        
    }
    

    

}
