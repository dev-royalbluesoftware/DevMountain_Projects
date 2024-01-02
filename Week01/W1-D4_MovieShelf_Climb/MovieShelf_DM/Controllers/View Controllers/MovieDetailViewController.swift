//
// MovieDetailViewController.swift
// MovieShelf_DM
//


import UIKit

class MovieDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var boxOfficeLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    // MARK: - Properties
    // landing pad
    var movie: Movie?
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        setupMovie()
    }
    
    // MARK: - Helper Functions
    
    func setupMovie() {
        guard let movie = movie else { return }
        
        movieTitleLabel.text = movie.title
        releaseYearLabel.text = String(movie.releaseYear)
        
        if movie.boxOffice > 0 {
            boxOfficeLabel.text = "$\(movie.boxOffice) M"
        } else {
            boxOfficeLabel.text = "N/A"
        }
        boxOfficeLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        posterImageView.image = movie.poster
        posterImageView.layer.cornerRadius = 15
        posterImageView.layer.borderWidth = 1
        
        movieDescriptionLabel.text = movie.description
    }
}
