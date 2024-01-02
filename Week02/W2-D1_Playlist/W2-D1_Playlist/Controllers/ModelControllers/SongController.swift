//
// SongController.swift
// W2-D1_Playlist
//


import Foundation

class SongController {
    
    // MARK: - Shared Instance (singleton)
    
    // A shared instance lets you acces the same SongController in memory, every time (read and write)
    // Global access to your functions on the controller - [Additional benefit]
    static let sharedInstance = SongController()
    
    // MARK: - Source of Truth
    
    var songs: [Song] = []
    
    // MARK: - CRUD Functions  (create, read, update, delete)
    
    func createSong(songTitle: String, artist: String) {
        let newSong = Song(songTitle: songTitle, artist: artist)
        songs.append(newSong)
        
        saveToPersistenceStore()
    }
    
    func deleteSong(song: Song) {
        guard let index = songs.firstIndex(of: song) else { return }
        songs.remove(at: index)
        
        saveToPersistenceStore()
    }
    
    // MARK: - Local Persistence
    /*
     saving data to the phone and using a URL as the memory address for that data
     */
    
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Playist.json")
        
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(songs)
            try data.write(to: createPersistenceStore())
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            songs = try JSONDecoder().decode([Song].self, from: data)
            
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
