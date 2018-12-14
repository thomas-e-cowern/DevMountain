//
//  ItemTableViewCell.swift
//  AppleSearch
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemSubtitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!

    var item: AppStoreItem? {
        didSet {
            guard let item = item else { return }
            itemTitleLabel.text = item.title
            itemSubtitleLabel.text = item.subtitle
        }
    }
    
}
