//
// MovieListTableViewController.swift
// MovieShelf_DM
//


import UIKit

class MovieListTableViewController: UITableViewController {

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let movie = MovieController.movies[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = movie.title
        content.textProperties.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        content.textProperties.color = .systemIndigo
        
        content.secondaryText = String(movie.releaseYear)
        content.secondaryTextProperties.font = UIFont(name: "CourierNewPSMT", size: 17) ?? .systemFont(ofSize: 17)
        cell.contentConfiguration = content
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // IIDOO, Identifier, IndexPath, Destination, Object to send, Object Sent
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? MovieDetailViewController else { return }
            
            let movieToSend = MovieController.movies[indexPath.row]
            destinationVC.movie = movieToSend
        }
    }
}
