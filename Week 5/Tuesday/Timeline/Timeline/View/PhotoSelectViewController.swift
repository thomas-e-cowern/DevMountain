//
//  PhotoSelectViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/2/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class PhotoSelectViewController: UIViewController {

    @IBOutlet weak var pickerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickerSelectImageButtonTapped(_ sender: Any) {
        print("selectImageButtonTapped")
        let image = UIImage(named: "1-by-1-1024x1024")
        pickerImageView.image = image
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
