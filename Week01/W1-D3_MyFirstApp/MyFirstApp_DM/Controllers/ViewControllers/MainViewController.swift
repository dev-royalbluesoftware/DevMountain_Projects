//
// MainViewController.swift
// MyFirstApp_DM
//


import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Johnny Appleseed"
    }
}
