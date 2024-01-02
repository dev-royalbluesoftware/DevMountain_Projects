//
// BookController.swift
// BookShelf-Assessment_W1
//


import UIKit

class BookController {
    
    // MARK: - Properties
    
    static var books: [Book] {
        let gameOfThrones = Book(title: "A Game of Thrones", releaseYear: 1996, author: "George R.R. Martin", bookImage: UIImage(named: "gameofthrones")!, description: "Winter is coming. Such is the stern motto of House Stark, the northernmost of the fiefdoms that owe allegiance to King Robert Baratheon, in far-off King’s Landing. There Eddard Stark of Winterfell rules in Robert’s name. There his family dwells in peace and comfort: his proud wife, Catelyn; his sons Robb, Brandon, and Rickon; his daughters Sansa and Arya; and his bastard son, Jon Snow. Far to the north, behind the towering Wall, lie savage Wildings and worse—unnatural things relegated to myth during the centuries-long summer, but proving all too real and all too deadly in the turning of the season.")
        
        let halfBloodPrince = Book(title: "The Half-Blood Prince", releaseYear: 2005, author: "J.K. Rowling", bookImage: UIImage(named: "halfbloodprince")!, description: "The war against Voldemort is not going well; even the Muggles have been affected. Dumbledore is absent from Hogwarts for long stretches of time, and the Order of the Phoenix has already suffered losses.  And yet . . . as with all wars, life goes on. Sixth-year students learn to Apparate. Teenagers flirt and fight and fall in love. Harry receives some extraordinary help in Potions from the mysterious Half-Blood Prince. And with Dumbledore's guidance, he seeks out the full, complex story of the boy who became Lord Voldemort -- and thus finds what may be his only vulnerability.")
        
        let fellowshipOfTheRing = Book(title: "The Fellowship of the Ring", releaseYear: 1954, author: "J.R.R. Tolkien", bookImage: UIImage(named: "fellowshipofthering")!, description: "The first volume in J.R.R. Tolkien's epic adventure. One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them In ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others.")
        
        let divergent = Book(title: "Divergent", releaseYear: 2011, author: "Veronica Roth", bookImage: UIImage(named: "divergent")!, description: "One choice can transform you. Beatrice Prior's society is divided into five factions—Candor (the honest), Abnegation (the selfless), Dauntless (the brave), Amity (the peaceful), and Erudite (the intelligent). Beatrice must choose between staying with her Abnegation family and transferring factions. Her choice will shock her community and herself. But the newly christened Tris also has a secret, one she's determined to keep hidden, because in this world, what makes you different makes you dangerous.")
        
        let twilight = Book(title: "Twilight", releaseYear: 2005, author: "Stephanie Meyer", bookImage: UIImage(named: "twilight")!, description: "Bella Swan moves from Phoenix, Arizona to live with her father in Forks, Washington to allow her mother to travel with her new husband, a minor league baseball player. After moving to Forks, Bella finds herself involuntarily drawn to a mysterious, handsome boy, Edward Cullen and eventually learns that he is a member of a vampire family which drinks animal blood rather than human blood. Edward and Bella fall in love, while James, a sadistic vampire from another coven, is drawn to hunt down Bella. Edward and the other Cullens defend Bella. She escapes to Phoenix, where she is tricked into confronting James, who tries to kill her. She is seriously wounded, but Edward rescues her and they return to Forks.")
        
        let hungerGames = Book(title: "The Hunger Games", releaseYear: 2008, author: "Suzanne Collins", bookImage: UIImage(named: "thehungergames")!, description: "In the ruins of a place once known as North America lies the nation of Panem, a shining Capitol surrounded by twelve outlying districts. Long ago the districts waged war on the Capitol and were defeated. As part of the surrender terms, each district agreed to send one boy and one girl to appear in an annual televised event called, \"The Hunger Games\" a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with her mother and younger sister, regards it as a death sentence when she is forced to represent her district in the Games. The terrain, rules, and level of audience participation may change but one thing is constant: kill or be killed.")
        
        return [gameOfThrones, halfBloodPrince, fellowshipOfTheRing, divergent, twilight, hungerGames]
    }
}
