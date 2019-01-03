//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postaptionLabel: UILabel!
    @IBOutlet weak var postCommentCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
