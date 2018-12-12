//
//  PostController.swift
//  WhyiOS
//
//  Created by Thomas Cowern New on 12/12/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

class PostController {
    
    static let baseUrl = URL(string: "https://whydidyouchooseios.firebaseio.com/reasons")
    
    static func fetchPosts(completion: @escaping ([Post]?) -> Void) {
        // Construct the URL Request
        guard  let url = baseUrl else {
            completion(nil)
            return
        }
        
        let fullUrl = url.appendingPathExtension("json")
        
        var request = URLRequest(url: fullUrl)
        request.httpBody = nil
        request.httpMethod = "GET"
        
        print(request.url?.absoluteString ?? "No Url")
        
        // Call the dataTask (serialize, .resume, completion)
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
                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: [String : String]]
                let posts = jsonDictionary?.compactMap{ Post(dict: $0.value) }
                completion(posts)
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
    
    static func postReason(name: String, reason: String, cohort: String?, completion: @escaping (Bool) -> ()) {
        // 1 - Constructing the url request
        guard let url = baseUrl?.appendingPathExtension("json") else { return }
        
        let post = Post(name: name, reason: reason, cohort: cohort)
        
        var request = URLRequest(url: url)
        
        do {
            let jsonEncoder = JSONEncoder()
            let data = try jsonEncoder.encode(post)
            request.httpMethod = "POST"
            request.httpBody = data
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                    completion(false)
                }
                print(response ?? "No response")
                completion(true)
            }.resume()
            
        } catch  {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            completion(false)
            return
        }
    }
}
