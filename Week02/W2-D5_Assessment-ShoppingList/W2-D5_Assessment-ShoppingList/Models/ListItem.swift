//
// ListItem.swift
// W2-D5_Assessment-ShoppingList
//


import Foundation

class ListItem: Codable {
    
    // MARK: - Properties
    
    let itemTitle: String
    var isComplete: Bool
    let uuid: String
    
    // initializer
    init(itemTitle: String, isComplete: Bool = false, uuid: String = UUID().uuidString) {
        self.itemTitle = itemTitle
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable

extension ListItem: Equatable {
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
