//
//  CardViewController.swift
//  DeckOfOneCardC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        TECCardController.drawCard { (card) in
            TECCardController.fetchCardImage(with: card, completion: { (image) in
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
            
            
    }
    
}
