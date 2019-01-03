//
//  PostController.swift
//  Timeline
//
//  Created by Thomas Cowern New on 1/1/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func addComment(text: String, post: Post, completion: @escaping (Comment) -> ()) {
        print("hit add Comment")
        let comment = Comment(text: text, post: post)
        print(comment.text)
        post.comments.append(comment)
        completion(comment)
        return
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Post) -> ()) {
        let post = Post(photo: image, caption: caption, comments: [])
        posts.append(post)
        print(post.caption)
        completion(post)
        return
    }
}
