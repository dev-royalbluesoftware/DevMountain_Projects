//
// Book.swift
// BookShelf-Assessment_W1
//


import UIKit

class Book {
    
    // MARK: - Properties
    
    let title: String
    let releaseYear: Int
    let author: String
    let bookImage: UIImage
    let description: String
    
    // memberwise Initializer
    init(title: String, releaseYear: Int, author: String, bookImage: UIImage, description: String) {
        self.title = title
        self.releaseYear = releaseYear
        self.author = author
        self.bookImage = bookImage
        self.description = description
    }
}
