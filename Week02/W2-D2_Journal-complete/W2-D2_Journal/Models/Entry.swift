//
// Entry.swift
// W2-D2_Journal
//


import Foundation

class Entry: Codable {

    //MARK: - Properties

    var title : String
    var body: String
    let timestamp: Date
    let uuid: String
    
    // memberwise initializer
    init(title: String, body: String, timestamp: Date = Date(), uuid: String = UUID().uuidString) {
        self.title = title
        self.body = body
        self.timestamp = timestamp
        self.uuid = uuid
    }
}

//MARK: - Extension Equatable

extension Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
