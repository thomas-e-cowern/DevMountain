//
//  QuoteDetailViewController.swift
//  KanyeQuotes
//
//  Created by Thomas Cowern New on 12/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var didHeSayItLabel: UILabel!
    @IBOutlet weak var KanyeWestImageView: UIImageView!
    
    var quote: Quote? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    func updateViews() {
        quoteLabel.text = quote?.text
        if let isQuoteTrue = quote?.isKanyeQuote {
            didHeSayItLabel.text = "\(isQuoteTrue)"
        }
    }
}
