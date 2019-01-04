//
//  ContactDetialViewController.swift
//  Contacts
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ContactDetialViewController: UIViewController {
    @IBOutlet weak var contactNameLabel: UITextField!
    @IBOutlet weak var contactPhoneLabel: UITextField!
    @IBOutlet weak var contactEmailLabel: UITextField!
    
    // MARK: - Properties
    var contact: Contact?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewIfNeeded()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // Determine if the contact exists
        if let contact = contact {
            guard let name = contactNameLabel.text, let phoneNumber = contactPhoneLabel.text, let email = contactEmailLabel.text else { return }
            
            // Update the contacts info
            ContactController.shared.updateContact(contact: contact, name: name, phoneNumber: phoneNumber, email: email) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                    print("There was an error in \(#function)")
                }
            }
        } else {
            
            // Get the new contact info
            guard let name = contactNameLabel.text, let phoneNumber = contactPhoneLabel.text, let email = contactEmailLabel.text else { return }
            
            // Add the contact info
            ContactController.shared.addContactWith(name: name, phoneNumber: phoneNumber, email: email) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                        print("Error creating the new contact")
                }
            }
        }
    }
    
    // MARK: - Methods
    // Checking contact and updating when called
    func updateViews() {
        if let contact = contact {
            contactNameLabel.text = contact.name
            contactPhoneLabel.text = contact.phoneNumber
            contactEmailLabel.text = contact.email
            self.title = "Edit Contact"
        } else {
            self.title = "Add Contact"
        }
    }
}
