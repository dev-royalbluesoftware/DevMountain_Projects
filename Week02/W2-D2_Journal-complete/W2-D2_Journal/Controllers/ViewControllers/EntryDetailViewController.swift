//
// EntryDetailViewController.swift
// W2-D2_Journal
//


import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
    
    var entry: Entry?
    var journal: Journal?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let journal = journal,
              let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        
        if let entry = entry {
            EntryController.update(entry: entry, title: title, body: body)
       
        } else {
            EntryController.createEntryWith(title: title, body: body, journal: journal)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let entry = entry else {return}
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
