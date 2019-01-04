//
//  SearchableRecord.swift
//  Contacts
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}
