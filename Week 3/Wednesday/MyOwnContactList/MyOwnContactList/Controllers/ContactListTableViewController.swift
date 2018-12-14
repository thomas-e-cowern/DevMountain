//
//  ContactListTableViewController.swift
//  MyOwnContactList
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
    var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
   
        reloadContacts()
    }
    
    @IBAction func addContactButtonTapped(_ sender: Any) {
        self.addContactInfo()
    }
    
    @IBAction func refreshContactButtonTapped(_ sender: Any) {
        reloadContacts()
    }
    
    func reloadContacts () {
        ContactsController.fetchContacts { (contacts) in
            self.contacts = contacts ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func addContactInfo() {
        let alertController = UIAlertController(title: "Add Contact", message: "Add Contact info below", preferredStyle: .alert)
        alertController.addTextField { (firstNameTextField) in
            firstNameTextField.placeholder = "Enter first name here..."
        }
        alertController.addTextField { (lastNameTextField) in
            lastNameTextField.placeholder = "Enter last name here..."
        }
        alertController.addTextField { (emailTextField) in
            emailTextField.placeholder = "Enter emial here..."
        }
        alertController.addTextField { (cellTextField) in
            cellTextField.placeholder = "Enter cell number here..."
        }
        alertController.addTextField { (homeTextField) in
            homeTextField.placeholder = "Enter home number here..."
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addContact = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let firstName = alertController.textFields?[0].text, !firstName.isEmpty,
            let lastName = alertController.textFields?[1].text, !lastName.isEmpty,
            let emailAddress = alertController.textFields?[2].text, !emailAddress.isEmpty else { return }
            
            let cellNumber: Int? = Int((alertController.textFields?[3].text)!)
            let homeNUmber: Int? = Int((alertController.textFields?[4].text)!)
            
            ContactsController.addContactInfo(firstName: firstName, lastName: lastName, emailAddress: emailAddress, cellPhone: cellNumber, homePhone: homeNUmber, completion: { (success) in
                if success {
                    self.reloadContacts()
                }
            })
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addContact)
        self.present(alertController, animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row].firstName), \(contacts[indexPath.row].lastName)"
        cell.detailTextLabel?.text = contacts[indexPath.row].email
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditContact" {
            if let destinationVC = segue.destination as? ContactDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let contact = contacts[indexPath.row]
                    destinationVC.contact = contact
                }
            }
            
        }
    }
}
