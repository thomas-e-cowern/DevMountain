//
//  ContactsController.swift
//  MyOwnContactList
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class ContactsController {
    
    static let baseUrl = URL(string: "https://contact-list-e2336.firebaseio.com/contacts")
    
    static func fetchContacts(completion: @escaping ([Contact]?) -> Void) {
        guard let url = baseUrl?.appendingPathExtension("json") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
//        print(request.url?.absoluteString ?? "No Url")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: [String : Any]]
                let contacts = jsonDictionary?.compactMap{ Contact(dict: $0.value) }
                print(contacts ?? "No contacts")
                completion(contacts)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
                return
            }
            }.resume()
    }
    
    static func addContactInfo(firstName: String, lastName: String, emailAddress: String, cellPhone: Int?, homePhone: Int?, completion: @escaping (Bool) -> ()) {
        
        guard let url = baseUrl?.appendingPathExtension("json") else { return }
        
        let contact = Contact(firstName: firstName, lastName: lastName, email: emailAddress, cellPhone: cellPhone, homePhone: homePhone)
        
        var request = URLRequest(url: url)
        
        do {
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(contact)
            request.httpMethod = "POST"
            request.httpBody = data

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                    completion(false)
                }
                print(response ?? "No POST response")
                completion(true)
            }.resume()
        } catch  {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            completion(false)
            return
        }
    }
}
