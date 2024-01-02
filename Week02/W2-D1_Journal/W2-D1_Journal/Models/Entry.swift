//
// Entry.swift
// W2-D1_Journal
//


import Foundation

class Entry: Codable {
    
    // MARK: - Properties
    
    let title: String
    let body: String
    let timeStamp: Date
    let uuid: String
    
    // memberwise initializer
    init(title: String, body: String, timeStamp: Date = Date(), uuid: String = UUID().uuidString) {
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
        self.uuid = uuid
    }
}

// MARK: - Extension - Equatable

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
