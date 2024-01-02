//
// BookDetailViewController.swift
// BookShelf-Assessment_W1
//


import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bookTitleLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var bookDescriptionLabel: UILabel!
    
    // MARK: - Properties
    
    var book: Book?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    // MARK: - Helper Functions
    
    func updateView() {
        guard let book = book else { return }
        bookTitleLabel.text = book.title
        authorNameLabel.text = book.author
        bookImageView.image = book.bookImage
        releaseYearLabel.text = "\(book.releaseYear)"
        bookDescriptionLabel.text = book.description
        
        bookImageView.layer.cornerRadius = 15
        bookImageView.layer.borderWidth = 1
    }
}
