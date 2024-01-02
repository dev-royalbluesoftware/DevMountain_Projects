//
// Character.swift
// W2-D4_StarWars
//


import UIKit

class Character {
    
    // MARK: - Properties
    
    let name: String
    let photo: UIImage?
    let faction: String
    let uuid: String
    
    // memberwise initializer
    init(name: String, photo: UIImage?, faction: String, uuid: String = UUID().uuidString) {
        self.name = name
        self.photo = photo
        self.faction = faction
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
