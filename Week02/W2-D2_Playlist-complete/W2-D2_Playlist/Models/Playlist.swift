//
// Playlist.swift
// W2-D2_Playlist
//


import Foundation

class Playlist: Codable {
    
    // MARK: - Properties
    
    let name: String
    var songs: [Song]
    let uuid: String
    
    // memberwise initializer
    init(name: String, songs: [Song] = [], uuid: String = UUID().uuidString) {
        self.name = name
        self.songs = songs
        self.uuid = uuid
    }
}

// MARK: - Extension - Equatable

extension Playlist: Equatable {
    static func == (lhs: Playlist, rhs: Playlist) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
