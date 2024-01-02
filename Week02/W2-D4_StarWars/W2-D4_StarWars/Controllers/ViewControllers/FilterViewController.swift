//
// FilterViewController.swift
// W2-D4_StarWars
//


import UIKit

protocol FilterSelectionDelegate: AnyObject {
    func selected(faction: String)
}

class FilterViewController: UIViewController {

    // MARK: - Properties
    
    weak var delegate: FilterSelectionDelegate?
    
    // MARK: - Actions
    
    @IBAction func sithButtonTapped(_ sender: UIButton) {
        delegate?.selected(faction: "sith")
        self.dismiss(animated: true)
    }
    
    @IBAction func jediButtonTapped(_ sender: UIButton) {
        delegate?.selected(faction: "jedi")
        self.dismiss(animated: true)
    }
}
