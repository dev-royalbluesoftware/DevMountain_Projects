//
// BookListTableViewController.swift
// BookShelf-Assessment_W1
//


import UIKit

class BookListTableViewController: UITableViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BookController.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        let book = BookController.books[indexPath.row]
        
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = book.title
        cellContent.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cellContent.textProperties.color = .label
        
        cellContent.secondaryText = String(book.releaseYear)
        cellContent.secondaryTextProperties.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        cellContent.secondaryTextProperties.color = .systemRed
        cell.contentConfiguration = cellContent
        
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO: Identifier, IndexPath, Destination, Object to Send, Object Sent
        if segue.identifier == "toDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? BookDetailViewController else { return }
    
            let bookToSend = BookController.books[indexPath.row]
            destinationVC.book = bookToSend
        }
    }
}
