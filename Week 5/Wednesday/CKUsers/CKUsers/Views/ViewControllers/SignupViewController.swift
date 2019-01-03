//
//  SignupViewController.swift
//  CKUsers
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var petNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PetOwnerController.shared.fetchCurrentPetOwner { (success) in
            if success {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toEntries", sender: self)
                }
            }
        }
    }
    

    
    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toEntries" {
//            let destinationVC = segue.destination as! WelcomeViewController
//            let loggedInPetOwner = PetOwnerController.shared.loggedInPetOwner
//            destinationVC.petOwner = loggedInPetOwner
//        }
//    }
    

    @IBAction func signupButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text, let petname = petNameTextField.text else { return }
        PetOwnerController.shared.createPetOwner(with: email, password: password, petname: petname) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toEntries", sender: self)
                }
            }
        }
    }
}
