//
//  CardViewController.swift
//  DeckOfCardsiOS23
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var cardImage: UIImageView!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        CardController.draw(numberOfCards: 1) { (cards) in
            guard let firstCard = cards.first else { return }
            CardController.getImage(for: firstCard, completion: { (image) in
                guard let image = image else { return }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                DispatchQueue.main.async {
                    self.cardImage.image = image
                }
                
            })
        }
        
    }
}
