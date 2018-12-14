//
//  Representative.swift
//  Representative
//
//  Created by Thomas Cowern New on 12/13/18.
//  Copyright © 2018 Thomas Cowern New. All rights reserved.
//

import Foundation

struct  TopLevelDictionary: Decodable {
    let representatives: [Representative]
    
    enum CodingKeys: String, CodingKey {
        case representatives = "results"
    }
}

struct Representative: Decodable {
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}
