//
//  Person.swift
//  CyclicalAssets
//
//  Created by Thomas Cowern New on 10/5/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name))"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            self?.netWorthDidChange(to: netWorth)
            return
        }
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
 
        for i in 0..<assets.count {
            print("This Asset: \(assets[i])")
        }
        accountant.gained(asset) {
            asset.owner = self
            assets.append(asset)
        }
        print("Assets: \(assets)")
    }
    
    func surrenderOwnership(of asset: Asset) {
        
        accountant.lost(asset) {
            asset.owner = self
            print("Surrendered ownership of \(self.assets)")
        }
    }
    
    func netWorthDidChange(to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Double) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
}

