//
// Journal.swift
// W2-D2_Journal
//


import Foundation

class Journal: Codable {
    
    //MARK: - Properties
    
    let title: String
    var entries: [Entry]
    let uuid: String
    
    // memberwise initializer
    init(title: String, entries: [Entry] = [], uuid: String = UUID().uuidString) {
        self.title = title
        self.entries = entries
        self.uuid = uuid
    }
}

//MARK: - Extension Equatable

extension Journal: Equatable {
    static func == (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
