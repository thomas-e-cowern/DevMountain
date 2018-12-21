//
//  PostTableViewCell.swift
//  RedditObjC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var redditImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var post: TECPost? {
        didSet {
            updateViews()
        }
    }
    
    var thumbnail: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
        titleLabel.text = post.title
        upsLabel.text = "\(post.ups) 👍"
        countLabel.text = "\(post.commentCount) 💬"
        redditImage.image = thumbnail
    }

}
