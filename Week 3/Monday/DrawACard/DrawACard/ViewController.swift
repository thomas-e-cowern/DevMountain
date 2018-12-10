//
//  ViewController.swift
//  DrawACard
//
//  Created by Thomas Cowern New on 12/8/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func drawButtonPressed(_ sender: Any) {
        if let card = DeckController.drawOneCard() {
            
            let image = DeckController.getImage(card.image)
            print(card)
            cardImageView.image = image
        }
    }
}

