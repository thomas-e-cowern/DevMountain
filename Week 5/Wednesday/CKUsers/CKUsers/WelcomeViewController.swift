//
//  WelcomeViewController.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    var petOwner: PetOwner?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        if let petOwner = petOwner {
            DispatchQueue.main.async {
                self.welcomeLabel.text = "Welcome \(petOwner.username), I hope you're with \(petOwner.petName)"
            }
        }
    }
}
