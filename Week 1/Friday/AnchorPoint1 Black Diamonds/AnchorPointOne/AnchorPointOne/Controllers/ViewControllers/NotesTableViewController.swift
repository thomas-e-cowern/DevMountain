//
//  NotesTableViewController.swift
//  AnchorPointOne
//
//  Created by Thomas Cowern New on 11/30/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    var editable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    
    }
    
    // MARK: - Actions
    @IBAction func organizeButtonPressed(_ sender: Any) {
        
        // MARK: - Rearrange cells in tableview
        if editable == false {
            self.tableView.isEditing = true
            editable = true
        } else {
            self.tableView.isEditing = false
            editable = false
        }
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none
        }
        
        func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            return false
        }
        
        NoteController.shared.saveToPersistentStore()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return NoteController.shared.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        
        let note = NoteController.shared.notes[indexPath.row]
        cell.textLabel?.text = note.text

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let noteToDelete = NoteController.shared.notes[indexPath.row]
            NoteController.shared.delete(note: noteToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedNote = NoteController.shared.notes[sourceIndexPath.row]
        NoteController.shared.notes.remove(at: sourceIndexPath.row)
        NoteController.shared.notes.insert(movedNote, at: destinationIndexPath.row)
        
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNote" {
            if let destinationVC = segue.destination as? NewNoteViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let note = NoteController.shared.notes[indexPath.row]
                    destinationVC.note = note
                }
            }
        }
    }
}

