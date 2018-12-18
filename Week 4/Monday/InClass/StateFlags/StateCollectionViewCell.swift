//
//  StateCollectionViewCell.swift
//  StateFlags
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class StateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var stateFlagView: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    
    var state: State? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let state = state else { return }
        stateLabel.text = state.name
        stateFlagView.image = UIImage(named: state.abbreviation)
    }
}
