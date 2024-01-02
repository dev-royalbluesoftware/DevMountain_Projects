//
// SongController.swift
// W2-D2_Playlist
//


import Foundation

class SongController {
    
    // MARK: - CRUD Functions  (create, read, update, delete) ...not using read
    
    static func createSong(songTitle: String, artist: String, playlist: Playlist) {
        let newSong = Song(songTitle: songTitle, artist: artist)
        playlist.songs.append(newSong)
        
        print("Successfully added \(songTitle) to \(playlist.name)")
        
        PlaylistController.sharedInstance.saveToPersistenceStore()
    }
    
    static func updateSong(song: Song, newSongTitle: String, newArtist: String) {
        song.songTitle = newSongTitle
        song.artist = newArtist
        
        PlaylistController.sharedInstance.saveToPersistenceStore()
    }
    
    static func deleteSong(song: Song, playlist: Playlist) {
        guard let index = playlist.songs.firstIndex(of: song) else { return }
        playlist.songs.remove(at: index)
        
        print("Successfully deleted \(song.songTitle) from \(playlist.name)")
        
        PlaylistController.sharedInstance.saveToPersistenceStore()
    }
}
