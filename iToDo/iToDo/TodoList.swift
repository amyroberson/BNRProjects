//
//  TodoList.swift
//  iToDo
//
//  Created by Amy Roberson on 4/10/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private let fileURL: URL = {
        let documentDirectoryURLS = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask)
        let documnetDirectoryURL = documentDirectoryURLS.first!
        
        return documnetDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    fileprivate var items: [String] = []
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        print("Saving items to file")
        if !itemsArray.write(to: fileURL, atomically: true) {
            print("could not save")
        }
    }
    
    func delete(index: Int){
        if items.count > index{
            items.remove(at: index)
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }
    
    func add(_ item: String) {
        items.append(item)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
}
