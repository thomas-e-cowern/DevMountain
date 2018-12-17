//
//  StateCollectionViewCell.swift
//  FlagsSwift
//
//  Created by Thomas Cowern New on 12/16/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class StateCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var flagLabel: UILabel!
    
    var state: State? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let state = state else { return }
        flagView.image = UIImage(named: state.abbreviation)
        flagLabel.text = state.name
    }
}
