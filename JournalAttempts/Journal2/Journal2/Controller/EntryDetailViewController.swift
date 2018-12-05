//
//  EntryDetailViewController.swift
//  Journal2
//
//  Created by Thomas Cowern New on 12/2/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        print(entry?.title)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let body = bodyTextView.text else { return }
        if let entry = entry {
            print("Upadate")
            EntryController.shared.update(entry: entry, title: title, body: body)
        } else {
            print("new")
            EntryController.shared.addEntryWith(title: title, body: body)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtontapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    
    func setUpViews() {
        if let entry = entry {
            self.title = "Edit Journal Entry"
            titleTextField.text = entry.title
            bodyTextView.text = entry.body
        } else {
            self.title = "Add Journal Entry"
        }
    }
}
