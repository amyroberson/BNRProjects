//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Amy Roberson on 4/9/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

class Asset : CustomStringConvertible{
    let name: String
    let value: Double
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset - \(name), worth \(value), owned by \(actualOwner)"
        } else {
            return "Asset - \(name), worth \(value), not owned currently"
        }
    }
    
    init(name: String, value: Double){
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}
