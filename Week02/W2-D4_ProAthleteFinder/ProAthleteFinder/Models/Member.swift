//
// Member.swift
// ProAthleteFinder
//


import UIKit

class Member {
    
    // MARK: - Properties
    
    let name: String
    let photo: UIImage?
    let clan: String
    let uuid: String
    
    // initializer
    init(name: String, photo: UIImage?, clan: String, uuid: String = UUID().uuidString) {
        self.name = name
        self.photo = photo
        self.clan = clan
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable

extension Member: Equatable {
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.uuid == rhs.uuid
    }
}
