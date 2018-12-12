//
//  ViewController.swift
//  PokeDex
//
//  Created by Thomas Cowern New on 12/10/18.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate  {
    
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    
    @IBOutlet weak var pokeImageView: UIImageView!
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    
    @IBOutlet weak var pokeWeighLabel: UILabel!
    
    @IBOutlet weak var pokeIdLabl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        PokemonController.searchForPokemon(by: searchText) { (pokemon) in
            guard let pokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                self.pokeSearchBar.text = ""
                self.pokeNameLabel.text = pokemon.name
                self.pokeWeighLabel.text = "\(pokemon.weight)"
                self.pokeIdLabl.text = "\(pokemon.id)"
            }
            
            PokemonController.getPokemonImage(pokemon, completion: { (image) in
                DispatchQueue.main.async {
                    self.pokeImageView.image = image
                }
            })
        }
    }
}

