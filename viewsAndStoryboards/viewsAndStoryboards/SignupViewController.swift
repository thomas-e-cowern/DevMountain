//
//  SignupViewController.swift
//  viewsAndStoryboards
//
//  Created by Thomas Cowern New on 11/24/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check the segues identifier
        if segue.identifier == "toWelcomeVC" {
            // get the object you want to send
            if let email = emailTextField.text {
                // Get the new view controller using segue.destination.
                if let destinationViewController = segue.destination as? WelcomeViewController {
                    // Pass the selected object to the new view controller.
                    destinationViewController.email = email
                }
            }
                
            
        }
    }
    

}
