//
//  ShoppingListTableViewCell.swift
//  ShoppingList
//
//  Created by Thomas Cowern New on 12/7/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

protocol ShoppingListTableViewCellDelegate: class {
    func shoppingListButtonTapped(_ cell: ShoppingListTableViewCell)
}

class ShoppingListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var shoppingListCellLAbel: UILabel!
    @IBOutlet weak var shoppingListCellButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: ShoppingListTableViewCellDelegate?
    
    var shoppingList: ShoppingList? {  // Landingpad for data
        didSet {
            updateViews()
        }
    }
    
    // Changes button background image based on isBought boolean
    func toggleButton(with shoppingList: ShoppingList) {
        if shoppingList.isBought == true {
            shoppingListCellButton.setBackgroundImage(UIImage(named: "check"), for: .normal)
        } else {
            shoppingListCellButton.setBackgroundImage(UIImage(named: "box"), for: .normal)
        }
    }
    
    @IBAction func shoppingListButtonPressed(_ sender: UIButton) {
        delegate?.shoppingListButtonTapped(self)
    }
    
    func updateViews() {
        if let shoppingList = shoppingList {
            shoppingListCellLAbel.text = shoppingList.name

            if shoppingList.isBought == true {
                shoppingListCellButton.setBackgroundImage(UIImage(named: "check"), for: .normal)
            } else {
                shoppingListCellButton.setBackgroundImage(UIImage(named: "box"), for: .normal)
            }
        }
    }
}
