//
//  CardTableViewController.swift
//  PPokeCardsiOS23keCardsiOS23
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    // MARK: - Properties
    var pokemonCards: [PokemonCard] = []
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
 
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemonCards.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! PokemonCardTableViewCell
        let pokemonCard = pokemonCards[indexPath.row]
        cell.pokemonCard = pokemonCard

        return cell
    }

}

extension CardTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchTerm = searchBar.text ?? ""
        
        PokemonCardController.fetchPokemonCards(with: searchTerm) { (pokemonCards) in
            guard let fetchedPokemonCards = pokemonCards else { return }
            self.pokemonCards = fetchedPokemonCards
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
