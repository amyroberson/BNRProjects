//
//  Person.swift
//  CyclicalAssets
//
//  Created by Amy Roberson on 4/9/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible{
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    
    var description: String {
        return "Person \(name)"
    }
    
    init(name: String) {
        self.name = name
        
        accountant.netWorthChangedHandler = {
            [weak self] networth in
            
            self?.netWorthDidChange(to: networth)
            return
        }
    }
    
    deinit{
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
        accountant.gained(asset) {
            asset.owner = self
            assets.append(asset)
        }
        
    }
    
    func netWorthDidChange( to netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
    
    func useNetWorthChangedHandler(handler: @escaping (Double) -> Void) {
        accountant.netWorthChangedHandler = handler
    }
    
}
