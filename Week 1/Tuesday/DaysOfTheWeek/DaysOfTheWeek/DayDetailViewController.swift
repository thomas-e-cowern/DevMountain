//
//  DayDetailViewController.swift
//  DaysOfTheWeek
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class DayDetailViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    
    var day: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayLabel.text = "Today is \(day ?? "Tom Day")"
       
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
}
