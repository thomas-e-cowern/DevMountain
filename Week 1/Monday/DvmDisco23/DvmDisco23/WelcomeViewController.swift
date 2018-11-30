//
//  WelcomeViewController.swift
//  DvmDisco23
//
//  Created by Thomas Cowern New on 11/26/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var name: String = ""
    
    // MARK: - ViewLifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
       welcomeLabel.text = "Wlecome, \(name)"
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
