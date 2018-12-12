//
//  PokemonController.swift
//  PokeDex
//
//  Created by Thomas Cowern New on 12/10/18.
//

import UIKit

class PokemonController {
    static func searchForPokemon(by searchTerm: String, completion: @escaping ((Pokemon?) -> Void)) {
        let basrUrlAsString: String = "https://pokeapi.co/api/v2/pokemon/"
        let urlAsString = basrUrlAsString + searchTerm.lowercased()
        guard let url = URL(string: urlAsString) else {
            print("url not valid")
            completion(nil)
            return
        }
        
        //        let data = try Data(contentsOf: url)
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error with URL Session: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Data was founf")
                completion(nil)
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let pokemon = try jsonDecoder.decode(Pokemon.self, from: data)
                completion(pokemon)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
        }
        dataTask.resume()
        return
    }
    
    static func getPokemonImage(_ pokemon: Pokemon, completion: @escaping ((UIImage?)) -> Void) {
        guard let urlForImage = URL(string: pokemon.sprites.pokemanImageUrlAsString) else {
            completion(nil)
            return
        }
        
        
        let dataTask = URLSession.shared.dataTask(with: urlForImage) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data was recievedfor Pokemon image")
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            completion(image)
            
        }
        dataTask.resume()
    }
}
