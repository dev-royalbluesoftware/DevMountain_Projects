//
// PlaylistListViewController.swift
// W2-D2_Playlist
//


import UIKit

class PlaylistListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        
        PlaylistController.sharedInstance.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        playlistTableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction func addPlaylistButtonTapped(_ sender: UIBarButtonItem) {
        presentNewPlaylistAlert()
    }
    
    // MARK: - Helper Functions
    
    func presentNewPlaylistAlert() {
        // create the AlertController
        let playlistAlert = UIAlertController(title: "New Playlist", message: "Enter new playlist name", preferredStyle: .alert)
        playlistAlert.addTextField() { (playlistNameTextField) in
            playlistNameTextField.placeholder = "Playlist name here..."
        }
        
        // create the Actions
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil) // handler is where functionality is performed
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            // functionality for the add button when pressed
            guard let playlistName = playlistAlert.textFields![0].text, !playlistName.isEmpty else { return } // can safely force unwrap
            PlaylistController.sharedInstance.createPlaylist(name: playlistName)
            
            self.playlistTableView.reloadData()
        }
        
        // Add the actions to the AlertController
        playlistAlert.addAction(cancelAction)
        playlistAlert.addAction(addAction)
        
        // Present the AlertController
        present(playlistAlert, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSongListVC" {
            guard let indexPath = playlistTableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? SongListTableViewController else { return }
            
            let playlistToSend = PlaylistController.sharedInstance.playlists[indexPath.row]
            destinationVC.playlist = playlistToSend
        }
    }
}

// MARK: - Extension - TableView Delegate and DataSource

extension PlaylistListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PlaylistController.sharedInstance.playlists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = playlist.name
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        if playlist.songs.count == 1 {
            content.secondaryText = "1 Song"
            
        } else {
            content.secondaryText = "\(playlist.songs.count) Songs"
        }
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlistToDelete = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlist: playlistToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
