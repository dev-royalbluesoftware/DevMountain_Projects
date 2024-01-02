//
// ClanSelectorViewController.swift
// ProAthleteFinder
//


import UIKit

// MARK: - Protocol

protocol ClanSelectorDelegate: AnyObject {
    func clanWasSelected(clan: String)
}

class ClanSelectorViewController: UIViewController {

    // MARK: - Properties
    
    weak var delegate: ClanSelectorDelegate?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func nonBuellButtonTapped(_ sender: Any) {
        delegate?.clanWasSelected(clan: "nonFamily")
        self.dismiss(animated: true)
    }
    
    @IBAction func buellButtonTapped(_ sender: Any) {
        delegate?.clanWasSelected(clan: "family")
        self.dismiss(animated: true)
    }
}
