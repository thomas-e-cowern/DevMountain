//
//  PokeDexViewController.swift
//  PokeDexiOS23
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PokeDexViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    func updateViews(with pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.nameLabel.text = "Name: \(pokemon.name)"
            self.idLabel.text = "Id: \(pokemon.id)"
            let abilityNames = pokemon.abilities.compactMap { $0.ability.name }
            self.abilityLabel.text = "Abilities: \(abilityNames.joined(separator: ", "))"
            
        }
        PokemonController.shared.fetchPokemonImage(for: pokemon, completion: { (image) in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        })
    }
}

extension PokeDexViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        PokemonController.shared.fetchPokemonWithName(nameOrId: searchText.lowercased()) { (pokemon) in
            guard let pokemon = pokemon else { return }
            self.updateViews(with: pokemon)
        }
    }
}
