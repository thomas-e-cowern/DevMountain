//
//  RedditPostTableViewCell.swift
//  InClassRedditC
//
//  Created by Thomas Cowern New on 12/19/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class RedditPostTableViewCell: UITableViewCell {

    @IBOutlet weak var redditImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    var post: TECPost? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        guard let post = post else { return }
        postTitleLabel.text = post.title
        upsLabel.text = "\(post.upVotes)"
        commentCountLabel.text = "\(post.commentCount)"
    }

}
