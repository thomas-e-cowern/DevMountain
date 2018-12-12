//
//  PersonController.swift
//  MyFavoirteApp
//
//  Created by Thomas Cowern New on 12/11/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class PersonController {
    
    static let shared = PersonController()
    var people: [Person] = []
    
    static let baseUrl = URL(string: "https://myfavoriteapp-9d43c.firebaseio.com")
    
    static func getPeople(completion: @escaping ((Bool) -> Void)) {
        
        let fullURL = baseUrl?.appendingPathComponent("people")
        
        guard let fullURLAsJson = fullURL?.appendingPathExtension("json") else {
            completion(false)
            return
        }
        var request = URLRequest(url: fullURLAsJson)
        request.httpMethod = "GET"
        request.httpBody = nil
        print(fullURLAsJson.absoluteString)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("There was no data")
                completion(false)
                return
            }
            
            guard let jsonDictionaries = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String : [String: Any]] else {
                print("Json data was not printed in a format we expected")
                completion(false)
                return
            }
            
            var people: [Person] = []
            for dict in jsonDictionaries {
                if let newPerson = Person(dict: dict.value) {
                    people.append(newPerson)
                    print("Got a person named: \(newPerson.name)")
                }
            }
            
            PersonController.shared.people = people
            completion(true)
        }
        dataTask.resume()
        
        
    }
    
    static func postPerson(name: String, favoriteApp: String, completion: @escaping ((Bool) -> Void)) {
        
        guard let fullURL = baseUrl?.appendingPathComponent("people").appendingPathExtension("json") else {
            print("Error getting the URL")
            completion(false)
            return
        }
        
        let newPerson = Person(name: name, favoriteApp: favoriteApp)
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = "POST"
        request.httpBody = newPerson.asData
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(false)
                return
            }
            guard data != nil else {
                print("No data recieved")
                completion(false)
                return
            }
            print("User was posted to firebase")
            PersonController.shared.people.append(newPerson)
            completion(true)
        }
        dataTask.resume()
    }
}
