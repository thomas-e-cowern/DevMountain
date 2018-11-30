//
//  FriendDetailViewController.swift
//  FriendRater
//
//  Created by Thomas Cowern New on 11/29/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class FriendDetailViewController: UIViewController {
    
    @IBOutlet weak var friendNameLabel: UITextField!
    
    @IBOutlet weak var friendRatingLabel: UITextField!
    
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = friendNameLabel.text, !name.isEmpty, let ratingAsString = friendRatingLabel.text,  !ratingAsString.isEmpty else { return }
        guard let rating = Int(ratingAsString) else { return }
        
        if let friend = friend {
            FriendController.shared.update(friend: friend, name: name, rating: rating)
        } else {
            FriendController.shared.createFriend(name: name, rating: rating)
        }
        
        self.navigationController?.popViewController(animated: true)
    
    }
    
    func setUpViews() {
        if let friend = friend {
            self.title = "Edit Friend"
            friendNameLabel.text = friend.name
            friendRatingLabel.text = "\(friend.rating)"
        } else {
            self.title = "Add Friend"
        }
    }
}

extension FriendDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == friendNameLabel {
            friendRatingLabel.becomeFirstResponder()
        } else {
             textField.resignFirstResponder()
        }
        return true
    }
}
