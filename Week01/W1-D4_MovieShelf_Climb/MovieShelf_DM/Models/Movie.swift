//
// Movie.swift
// MovieShelf_DM
//


import UIKit

class Movie {
    
    // MARK: - Properties
    
    let title: String
    let releaseYear: Int
    let boxOffice: Double
    let poster: UIImage
    let description: String
    
    // memberwise initializer
    init(title: String, releaseYear: Int, boxOffice: Double, poster: UIImage, description: String) {
        self.title = title
        self.releaseYear = releaseYear
        self.boxOffice = boxOffice
        self.poster = poster
        self.description = description
    }
}
