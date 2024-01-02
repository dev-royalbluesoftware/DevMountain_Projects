//
// SongDetailViewController.swift
// W2-D2_Playlist
//


import UIKit

class SongDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: - Properties
    
    var song: Song?
    var playlist: Playlist?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let songTitle = songTitleTextField.text, !songTitle.isEmpty,
              let artist = artistTextField.text, !artist.isEmpty,
              let playlist = playlist else { return }
    
        if let song = song {
            // line 18 has a value from the segue in SongListTableViewController cell: existing song selected, (updateSong)
            SongController.updateSong(song: song, newSongTitle: songTitle, newArtist: artist)
            
        } else {
            // line 18 does NOT have a value, the plus button on SongListTableViewController pressed, (createSong)
            SongController.createSong(songTitle: songTitle, artist: artist, playlist: playlist)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        songTitleTextField.text = ""
        artistTextField.text = ""
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let song = song else { return }
        songTitleTextField.text = song.songTitle
        artistTextField.text = song.artist
    }
}
