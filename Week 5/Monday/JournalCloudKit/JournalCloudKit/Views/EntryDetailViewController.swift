//
//  EntryDetailViewController.swift
//  JournalCloudKit
//
//  Created by Thomas Cowern New on 12/31/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextLabel: UITextField!
    @IBOutlet weak var bodyTextLabel: UITextView!
    
    // MARK: - Properties
    var entry: Entry?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Methods
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // Checking to see if the entry is new or updated
        if let entry = entry {
            guard let title = titleTextLabel.text, let bodyText = bodyTextLabel.text else { return }
            
            // Updating an existing entry
            EntryController.shared.updateEntry(entry: entry, title: title, body: bodyText, completion: { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                    print("😡 There was an error in \(#function)")
                }
            })
        } else {
            
            guard let title = titleTextLabel.text, let body = bodyTextLabel.text else { return }
            
            // Creating a new entry
            EntryController.shared.addEntryWith(title: title, body: body) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.navigationController?.popViewController(animated: true)
                    }
                } else {
                    print("Error creating the new entry")
                }
            }
        }
    }
    
    // MARK: - Updating views
    func updateViews() {
        if let entry = entry {
            titleTextLabel.text = entry.title
            bodyTextLabel.text = entry.bodyText
            self.title = "Edit Entry"
        } else {
            self.title = "Add Entry"
        }
    }
}
