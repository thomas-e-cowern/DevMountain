//
//  KanyeTableViewCell.swift
//  KanyeQuotes
//
//  Created by Thomas Cowern New on 12/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

protocol KanyeTableViewCellDelegate: class {
    func cellButtonTapped(_ cell: KanyeTableViewCell)
}

class KanyeTableViewCell: UITableViewCell {

    @IBOutlet weak var isKanyeQuoteButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    
    weak var delegate: KanyeTableViewCellDelegate?
    
    var quote: Quote? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func quoteButtonTapped(_ sender: Any) {
        delegate?.cellButtonTapped(self)
    }
    
    func toggleCell(with quote: Quote) {
        if quote.isKanyeQuote == true {
            isKanyeQuoteButton.setBackgroundImage(UIImage(named: "yesKanye"), for: .normal)
        } else {
            isKanyeQuoteButton.setBackgroundImage(UIImage(named: "noKanye"), for: .normal)
        }
    }
    
    func updateViews() {
        if let quote = quote {
            quoteLabel.text = quote.text
            if quote.isKanyeQuote == true {
                isKanyeQuoteButton.setBackgroundImage(UIImage(named: "yesKanye"), for: .normal)
            } else {
                isKanyeQuoteButton.setBackgroundImage(UIImage(named: "noKanye"), for: .normal)
            }
        }
    }
}
