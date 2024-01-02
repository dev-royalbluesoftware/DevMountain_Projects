//
// MovieController.swift
// MovieShelf_DM
//


import UIKit

class MovieController {
    
    // MARK: - Computed Property
    // mock data
    
    static let movies: [Movie] = {
        let knightstale = Movie(title: "A Knight\'s Tale", releaseYear: 2001, boxOffice: 56.1, poster: UIImage(named: "AKnightsTaleposter")!, description: "After his master dies, a peasant squire, fueled by his desire for food and glory, creates a new identity for himself as a knight.")
       
        let oceans11 = Movie(title: "Ocean\'s 11", releaseYear: 2001, boxOffice: 183.4, poster: UIImage(named: "Oceans11poster")!, description: "Danny Ocean and his ten accomplices plan to rob three Las Vegas casinos simultaneously.")
        
        let interstellar = Movie(title: "Interstellar", releaseYear: 2014, boxOffice: 188.2, poster: UIImage(named: "Interstellarposter")!, description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.")
        
        let southpaw = Movie(title: "Southpaw", releaseYear: 2015, boxOffice: 52.4, poster: UIImage(named: "Southpawposter")!, description: "After a fatal incident sends him on a rampant path of destruction, a champion boxer fights to get custody of his daughter and revive his professional career.")
        
        let theMartian = Movie(title: "The Martian", releaseYear: 2015, boxOffice: 228.4, poster: UIImage(named: "TheMartianposter")!, description: "An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.")
        
        let fortytwo = Movie(title: "42", releaseYear: 2013, boxOffice: 56.3, poster: UIImage(named: "42poster")!, description: "In 1947, Jackie Robinson becomes the first African-American to play in Major League Baseball in the modern era when he was signed by the Brooklyn Dodgers and faces considerable racism in the process.")
        
        let fordFerrari = Movie(title: "Ford v Ferrari", releaseYear: 2019, boxOffice: 117.6, poster: UIImage(named: "FordvFerrariposter")!, description: "American car designer Carroll Shelby and driver Ken Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order to defeat Ferrari at the 24 Hours of Le Mans in 1966.")
        
        let tripleFrontier = Movie(title: "Triple Frontier", releaseYear: 2019, boxOffice: 0, poster: UIImage(named: "TripleFrontierposter")!, description: "Loyalties are tested when five friends and former special forces operatives reunite to take down a South American drug lord, unleashing a chain of unintended consequences.")
        
        let americanSniper = Movie(title: "American Sniper", releaseYear: 2014, boxOffice: 350.1, poster: UIImage(named: "AmericanSniperposter")!, description: "Navy S.E.A.L. sniper Chris Kyle's pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home with his family after four tours of duty, however, Chris finds that it is the war he can't leave behind.")
        
        return [knightstale, oceans11, interstellar, southpaw, theMartian, fortytwo, fordFerrari, tripleFrontier, americanSniper]
    }()
}
