//
//  ViewController.swift
//  ExpandTest
//
//  Created by Thomas Cowern New on 1/7/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    // MARK: - Properties
    var isHidden = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - Actions
    @IBAction func viewMoreButtonTapped(_ sender: Any) {
        print("BUTTON TAPPED")
        if isHidden == false {
            moreInfoLabel.isHidden = false
            isHidden = true
        } else {
            moreInfoLabel.isHidden = true
            isHidden = false
        }

    }
    
}

