//
//  DetailViewController.swift
//  AboutMeWithSegue
//
//  Created by Thomas Cowern New on 11/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    
    var person: Person? {
        
        didSet {
            
            loadViewIfNeeded()
            
            updateView()
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func updateView() {
        
        nameLabel.text = person?.name
        
        titleLabel.text = person?.title
        
        ageLabel.text = "Age: \(String(describing: person?.age))"
        
        profileImageView.image = person?.profilePicture
        
        bioLabel.text = person?.bio
        
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
