//
//  RepDetailTableViewCell.swift
//  Representative
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class RepDetailTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextLabel: UILabel!
    @IBOutlet weak var partyTextLabel: UILabel!
    @IBOutlet weak var districtTextLabel: UILabel!
    @IBOutlet weak var websiteTextLabel: UILabel!
    @IBOutlet weak var phoneTextLabel: UILabel!
    
    // MARK: - Properties
    var representative: [Representative]? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Methods
    func updateViews() {
        guard let representative = representative else { return }

    }
}
