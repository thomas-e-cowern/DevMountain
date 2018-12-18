//
//  PokedexViewController.swift
//  PokemonC
//
//  Created by Thomas Cowern New on 12/18/18.
//  Copyright © 2018 Jayden Garrick. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UISearchBarDelegate {
    
    // MARK: - Properites
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var attacksLabel: UILabel!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonSearchBar.delegate = self
    }
    
    // MARK: - Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = pokemonSearchBar.text ?? ""
        
        TECPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            guard let pokemon = pokemon else { return }
            DispatchQueue.main.async {
                self.nameLabel.text = pokemon.name.capitalized
                self.idLable.text = "\(pokemon.identifier)"
                self.attacksLabel.text = pokemon.abilities?.joined(separator: ", ")
            }
            
        }
    }
}
