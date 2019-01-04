//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    
    
    @IBOutlet weak var addCaptionText: UITextField!
    
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addPostTapped(_ sender: Any) {
        print("AddPostButtonTapped")
        guard let photo = photo else { return }
        print("photo is Good to go...")
        guard let caption = addCaptionText.text, !caption.isEmpty else { return }
        print("caption is Good to go...")
        PostController.shared.createPostWith(image: photo, caption: caption) { (post) in
            print("Created post")
        }
        addCaptionText.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotoSelectVC" {
            guard let destinationVC = segue.destination as? PhotoSelectViewController else { return }
            destinationVC.delegate = self
        }
    }
}

extension AddPostTableViewController: PhotoSelectViewControllerDelegate {
    func photoSelected(_ photo: UIImage) {
        self.photo = photo
    }
}
