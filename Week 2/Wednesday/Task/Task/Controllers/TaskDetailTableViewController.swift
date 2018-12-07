//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Thomas Cowern New on 12/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    // MARK: - Properties
    var task: Task? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    var dueDateValue: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("Save")
        dueDateValue = dueDatePicker.date
        guard let name = nameTextField.text, let notes = notesTextView.text, let due = dueDateValue else { return }
        if let task = task {
            TaskController.shared.update(task: task, name: name, notes: notes, due: due)
        } else {
            TaskController.shared.add(taskWithName: name, notes: notes, due: due)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueDateValue = dueDatePicker.date
        dueDateTextField.text = dueDatePicker.date.stringValue()
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        nameTextField.resignFirstResponder()
        dueDateTextField.resignFirstResponder()
        notesTextView.resignFirstResponder()
    }
    
    // MARK: - Methods
    func updateViews() {
        if let task = task {
            self.title = "Edit Task"
            nameTextField.text = task.name
            dueDateTextField.text = task.due?.stringValue()
            notesTextView.text = task.notes
        } else {
            self.title = "Add Task"
        }
    }
}
