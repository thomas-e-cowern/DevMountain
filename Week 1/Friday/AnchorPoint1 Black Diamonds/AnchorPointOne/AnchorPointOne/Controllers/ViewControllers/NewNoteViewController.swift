//
//  NewNoteViewController.swift
//  AnchorPointOne
//
//  Created by Thomas Cowern New on 11/30/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController, UITextViewDelegate {

    // MARK: - Landingpad
    var note: Note?
    
    // MARK: - Outlets
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }

    // MARK: - Actions
    @IBAction func savedButtonTapped(_ sender: Any) {
        
        saveNote()
       
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Methods
    func setUpViews() {
        if let note = note {
            self.title = "Edit Note"
            noteText.text = note.text
        } else {
            self.title = "New Note"
        }
    }
    
    func saveNote() {
        guard let newNote = noteText.text, newNote != "Write your note..." else { return }
        
        if let note = note {
            NoteController.shared.update(note: note, text: newNote)
        } else {
            NoteController.shared.addNewNote(text: newNote)
        }
    }
}
