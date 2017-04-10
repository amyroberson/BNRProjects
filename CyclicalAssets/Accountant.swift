//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Amy Roberson on 4/9/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
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
}
