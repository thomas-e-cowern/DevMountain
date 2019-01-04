//
//  ViewController.swift
//  TikTok2
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var downVoteButton: UIButton!
    
    var tok: Tok? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func updateViews() {
        guard let tok = tok else { return }
        titleLabel.text = tok.title
        textLabel.text = tok.text
        upVoteButton.setTitle("Up Votes: \(tok.upVotes)", for: .normal)
        downVoteButton.setTitle("Down Votes: \(tok.downVotes)", for: .normal)
    }
    
    @IBAction func upVoteTapped(_ sender: Any) {
        updateCounts(from: 1)
    }
    
    @IBAction func downVoteTapped(_ sender: Any) {
        updateCounts(from: 0)
    }
    
    func updateCounts(from: Int) {
        guard let tok = tok else { return }
        _ = from == 1 ? (tok.upVotes += 1) : (tok.downVotes -= 1)
        TokController.shared.update(tok: tok, upVotes: tok.upVotes, downVotes: tok.downVotes) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.updateViews()
                }
            }
        }
    }
}

