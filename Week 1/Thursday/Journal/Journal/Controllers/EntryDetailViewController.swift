//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Thomas Cowern New on 11/29/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }

    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextView.text, !body.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.update(entry: entry, title: title, text: body)
        } else {
            EntryController.shared.addEntryWith(title: title, text: body)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    private func clearTextFields() {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        clearTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateViews() {
        if let entry = entry {
            self.title = "Edit Entry"
            titleTextField.text = entry.title
            bodyTextView.text = entry.text
            
        } else {
            self.title = "Add Entry"
        }
    }
    
}
