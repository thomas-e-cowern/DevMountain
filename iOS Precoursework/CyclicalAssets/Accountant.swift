//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Thomas Cowern New on 10/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gained(_ asset: Asset, completion: () -> Void) {
        netWorth += asset.value
        completion()
    }
    
    func lost(_ asset: Asset, completion: () -> Void) {
        netWorth -= asset.value
        completion()
    }
}

