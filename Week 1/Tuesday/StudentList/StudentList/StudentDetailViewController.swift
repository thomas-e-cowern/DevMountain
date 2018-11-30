//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        guard let student = student, isViewLoaded else { return }
        
        firstNameLabel.text = student.firstName
        lastNameLabel.text = student.lastName
        ageLabel.text = "\(student.age)"
    }

    var student: Student? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
}
