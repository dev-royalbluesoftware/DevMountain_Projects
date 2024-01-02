//
// JournalListViewController.swift
// W2-D2_Journal
//


import UIKit

class JournalListViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var journalTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journalTableView.delegate = self
        journalTableView.dataSource = self
        
        JournalController.sharedInstance.loadFromPersistenceStore()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        journalTableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func createNewJournalButtonTapped(_ sender: UIButton) {
        guard let journalTitle = journalTitleTextField.text, !journalTitle.isEmpty else { return }
        JournalController.sharedInstance.createJournalWith(title: journalTitle)
        
        journalTableView.reloadData()
        journalTitleTextField.text = ""
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue .identifier == "toEntryList" {
            guard let indexPath = journalTableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? EntryListTableViewController else { return }
            
            let journal = JournalController.sharedInstance.journals[indexPath.row]
            destinationVC.journal = journal
        }
    }
}

// MARK: - Extension - UITableView Delegate and DataSource

extension JournalListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        JournalController.sharedInstance.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = journalTableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        let journal = JournalController.sharedInstance.journals[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = journal.title
        content.textProperties.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        
        content.secondaryText = journal.entries.count == 1 ? "1 Entry" : "\(journal.entries.count) Entries"
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let journalToDelete = JournalController.sharedInstance.journals[indexPath.row]
            JournalController.sharedInstance.delete(journal: journalToDelete)
            
            journalTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
