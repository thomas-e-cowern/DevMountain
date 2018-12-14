//
//  PokemonCardTableViewCell.swift
//  PPokeCardsiOS23keCardsiOS23
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PokemonCardTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var pokemonCardImageView: UIImageView!
    
    var pokemonCard: PokemonCard? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Set up views
    func updateViews() {
        // make image appear
        guard let pokemonCard = pokemonCard else { return }
        PokemonCardController.fetchPokemonImage(with: pokemonCard) { (image) in
            DispatchQueue.main.async {
                self.pokemonCardImageView.image = image
            }
        }
        
    }
    
}
