//
//  PostController.swift
//  Post
//
//  Created by Thomas Cowern New on 12/10/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class PostController {
    
    // MARK: - Properties
    static let baseURL = URL(string: "https://devmtn-posts.firebaseio.com/posts")
    
    
    static var posts: [Post] = []
    
    static func fetchPosts(completion: @escaping () -> Void) {
        guard let url = baseURL else { completion() ; return }
        let getterEndpoint = url.appendingPathExtension("json")
        var request = URLRequest(url: getterEndpoint)
        request.httpMethod = "GET"
        request.httpBody = nil
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion()
                return
            }
            guard let data = data else { completion() ; return  }
            let jsonDecoder = JSONDecoder()
            do {
                let postsDictionary = try jsonDecoder.decode([String:Post].self, from: data)
                var posts: [Post] = postsDictionary.compactMap({ $0.value })
                posts.sort(by: { $0.timestamp > $1.timestamp })
                self.posts = posts
                completion()
            } catch {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion()
                return
            }
            
        }
        dataTask.resume()
    }
    
    static func addNewPostWith(username: String, text: String, completion: @escaping ([Post?]) -> Void) {
        let newPost = Post(username: username, text: text)
        var postData: Data
        
        do {
            let jsonEncoder = JSONEncoder()
            postData = try jsonEncoder.encode(newPost)

        } catch {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            completion([])
            return
        }
        
        guard let url = baseURL else { completion([nil]) ; return }
        let postEndpoint = url.appendingPathExtension("json")
        var request = URLRequest(url: postEndpoint)
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
                completion([])
                return
            }
        }
        dataTask.resume()
    }
}
