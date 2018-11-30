//
//  SignUpViewController.swift
//  DvmDisco23
//
//  Created by Thomas Cowern New on 11/26/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // I - restorationIdentifier
        // I - IndexPath // Will talk about tommorrow
        // D - Destination View Controller
        // O - getting your first object <O>bject out of your source of truth // Tommorrow
        // O - Setting the <O>bject  in the destination aka throwing item into basket
        
//        if segue.identifier == "ToWelcomeScreen" {
//            guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
//            welcomeViewController.name = nameTextField.name ?? "No Name"
//        }
    }
 

}
