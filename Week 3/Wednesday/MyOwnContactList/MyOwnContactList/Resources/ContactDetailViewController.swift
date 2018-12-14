//
//  ContactDetailViewController.swift
//  MyOwnContactList
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var cellTextField: UITextField!
    @IBOutlet weak var homeTextField: UITextField!
    
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    func setUpViews() {
        if let contact = contact {
            firstNameTextField.text = contact.firstName
            lastNameTextField.text = contact.lastName
            emailtextField.text = contact.email
            cellTextField.text = "\(contact.cellPhone)"
            homeTextField.text = "\(contact.homePhone)"
        }
    }
}
