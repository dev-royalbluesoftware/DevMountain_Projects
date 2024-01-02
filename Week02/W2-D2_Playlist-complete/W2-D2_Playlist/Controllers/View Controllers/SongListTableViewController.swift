//
// SongListTableViewController.swift
// W2-D2_Playlist
//


import UIKit

class SongListTableViewController: UITableViewController {

    // MARK: - Properties

    var playlist: Playlist?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
        
    // MARK: - TableView Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let playlist = playlist else { return cell }
        let song = playlist.songs[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = song.songTitle
        content.textProperties.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        content.secondaryText = song.artist
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist else { return }
            let songToDelete = playlist.songs[indexPath.row]
            SongController.deleteSong(song: songToDelete, playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sending playlist with either segue
        let playlist = self.playlist
        guard let destinationVC = segue.destination as? SongDetailViewController else { return }
        destinationVC.playlist = playlist
        
        if segue.identifier == "toSongDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let song = playlist?.songs[indexPath.row]
            destinationVC.song = song
        }
    }
}
