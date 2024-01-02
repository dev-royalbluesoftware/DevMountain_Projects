//
// Song.swift
// W2-D2_Playlist
//


import Foundation

class Song: Codable {
    
    // MARK: - Properties
    
    var songTitle: String
    var artist: String
    let uuid: String
    
    // memberwise Initializer
    init(songTitle: String, artist: String, uuid: String = UUID().uuidString) {
        self.songTitle = songTitle
        self.artist = artist
        self.uuid = uuid
    }
}

// MARK: - Extension Equatable

extension Song: Equatable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
