//
// SongListTableViewController.swift
// W2-D1_Playlist
//


import UIKit

class SongListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SongController.sharedInstance.loadFromPersistenceStore()
    }
    
    // MARK: - Actions
    
    @IBAction func addSongButtonTapped(_ sender: UIBarButtonItem) {
        guard let songTitle = songTitleTextField.text, !songTitle.isEmpty,  // ensure that songTitle is not empty
              let artist = artistTextField.text, !artist.isEmpty else { return } // ensure artist is not empty
        
        SongController.sharedInstance.createSong(songTitle: songTitle, artist: artist)
        
        tableView.reloadData()
        
        // superfluous items (into the weeds a bit for week2)
        songTitleTextField.text = ""
        artistTextField.text = ""
        songTitleTextField.becomeFirstResponder()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongController.sharedInstance.songs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let song = SongController.sharedInstance.songs[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = song.songTitle
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        content.textProperties.color = .systemBlue
        
        content.secondaryText = song.artist
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16, weight: .light)
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let songToDelete = SongController.sharedInstance.songs[indexPath.row]
            // call our deleteSong function from SongController to delete the selected song.
            SongController.sharedInstance.deleteSong(song: songToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
