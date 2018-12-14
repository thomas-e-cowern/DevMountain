//
//  AppStoreItemController.swift
//  AppleSearch
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class AppStoreItemController {
    static func getItemsOf(type: AppStoreItem.itemType, searchText: String, completion: @escaping (([AppStoreItem]) -> Void)) {
        
        let baseUrl = URL(string: "https://itunes.apple.com/search")!
        guard var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true) else {
            completion([])
            return
        }
        
        let searchTerm = URLQueryItem(name: "term", value: searchText)
        let entityQuery = URLQueryItem(name: "entity", value: type.rawValue)
        components.queryItems = [searchTerm, entityQuery]
        print(components.url)
        
        guard let url = components.url else {
            completion([])
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data was recieved from apple")
                completion([])
                return
            }
            
            guard let topLevelJSON = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : Any] else {
                print("Could not convert data to JSON")
                completion([])
                return
            }
            
            guard let appStoreDictionaries = topLevelJSON["results"] as? [[String : Any]] else {
                print("Could not get dictionaries from results")
                completion([])
                return
            }
            
            var allItems: [AppStoreItem] = []
            
            for itemDictionary in appStoreDictionaries {
                print("Item Dict: \(itemDictionary)")
                print("Type: \(type)")
                if AppStoreItem(itemType: type, dict: itemDictionary) != nil {
                    print("New Item")
                } else {
                    print("No New ITem")
                }
//                if let newItem = AppStoreItem(itemType: type, dict: itemDictionary) {
//                    print(newItem.title)
//                    allItems.append(newItem)
//                } else {
//                    print("There was a problem creating a new item")
//                }
                
            }
            
            print("Outcount: \(allItems.count)")
            
            completion(allItems)
        }.resume()
    }
}
