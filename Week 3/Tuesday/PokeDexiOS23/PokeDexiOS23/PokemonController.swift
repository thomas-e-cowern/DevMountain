//
//  PokemonController.swift
//  PokeDexiOS23
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import UIKit

class PokemonController {
    
    static let shared = PokemonController()
    private init() {}
    
    let baseURL = URL(string: "https://pokeapi.co/api/v2")
    
    func fetchPokemonWithName(nameOrId: String, completion: @escaping (Pokemon?) -> ()) {
        // 1 - Construct a URL/URL Request
        guard let url = baseURL?.appendingPathComponent("pokemon") else { completion(nil) ; return }
        let fullURL = url.appendingPathComponent(nameOrId)
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        print(request.url?.absoluteString ?? "No URL")
        
        // 2 - Calling the Datatask (Decode the data = don't forget to call .resume and completions)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            print("URLSession response: \(String(describing: response))")
            guard let data = data else { completion(nil) ; return }
            do {
                let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(pokemon)
                return
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
            }
            
        }.resume()
        
    }
    
    func fetchPokemonImage(for pokemon: Pokemon, completion: @escaping (UIImage?) -> Void) {
        // 1 - Construct the URL
        guard let url = URL(string: pokemon.sprites.imageUrl) else { completion(nil) ; return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        // 2 - Call the datatask (decode, resume, completion())
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            print(response ?? "No response")
            
            guard let data = data else { completion(nil) ; return }
            let image = UIImage(data: data)
            completion(image)

        }.resume()
    }
}
