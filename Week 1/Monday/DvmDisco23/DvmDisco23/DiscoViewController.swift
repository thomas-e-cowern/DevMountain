//
//  DiscoViewController.swift
//  DvmDisco23
//
//  Created by Thomas Cowern New on 11/26/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class DiscoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToDiscoButtonTapped(_ sender: UIButton) {
        print("Disco button tapped")
        if self.view.backgroundColor == UIColor.red {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.red
        }
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
