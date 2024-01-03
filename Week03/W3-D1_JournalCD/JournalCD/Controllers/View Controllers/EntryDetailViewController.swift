//
//
// JournalCD
// 
// EntryDetailViewController.swift
//
// Created by Royal Blue Software
// 


import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - Properties
    
    var entry: Entry? // landing pad
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = body
            
            EntryController.sharedInstance.updateEntry(entry)
            
        } else {
            EntryController.sharedInstance.createEntry(title: title, bodyOfText: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let entry = entry else { return } // make sure there is an entry, before updating the view.
        
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
}
