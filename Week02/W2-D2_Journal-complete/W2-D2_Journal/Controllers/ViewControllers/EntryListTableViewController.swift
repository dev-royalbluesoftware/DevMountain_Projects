//
// EntryListTableViewController.swift
// W2-D2_Journal
//


import UIKit

class EntryListTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var journal: Journal?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journal?.entries.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        guard let entry = journal?.entries[indexPath.row] else {return cell}
        
        var content = cell.defaultContentConfiguration()
        content.text = entry.title
        content.textProperties.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let journal = journal else {return}
            
            let entryToDelete = journal.entries[indexPath.row]
            EntryController.deleteEntry(entry: entryToDelete, journal: journal)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? EntryDetailViewController,
              let journal = journal else { return }
        
        destinationVC.journal = journal
        
        if segue.identifier == "toEntryDetailVC" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            let entry = journal.entries[index.row]
            destinationVC.entry = entry
        }
    }
}
