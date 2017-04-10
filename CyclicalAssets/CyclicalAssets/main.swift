//
//  main.swift
//  CyclicalAssets
//
//  Created by Amy Roberson on 4/9/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("created \(bob)")


print("The bob variable is now \(bob)")

var laptop: Asset? = Asset(name: "Abra", value: 12.00)
var hat: Asset? = Asset(name: "Top", value: 132.05)
var backpack: Asset? = Asset(name: "Blue BackPack", value: 35.0)

bob?.useNetWorthChangedHandler { networth in
    print("Bob's net worth is now \(networth)")
}
bob?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: hat!)

print("While bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print("After Bob is Deallocated, hat's owner is \(hat!.owner)")
laptop = nil
hat = nil
backpack = nil
