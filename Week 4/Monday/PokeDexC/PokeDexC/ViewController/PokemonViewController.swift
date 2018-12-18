//
//  PokemonViewController.swift
//  PokeDexC
//
//  Created by Thomas Cowern New on 12/17/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var pokemon: TECPokemon? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        TECPokemonController.shared().fetchPokemon(withSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
        }
                
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        DispatchQueue.main.async {
            self.nameLabel.text = pokemon.name
            self.idLabel.text = "\(pokemon.identifier)"
            self.abilitiesLabel.text = "\(pokemon.abilities)"
        }
    }
}
