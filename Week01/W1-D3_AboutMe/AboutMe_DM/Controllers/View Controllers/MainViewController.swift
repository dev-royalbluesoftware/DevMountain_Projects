//
// MainViewController.swift
// AboutMe_DM
//


import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAboutMe()
    }
    
    // MARK: - Helper Function
    
    func setUpAboutMe() {
        nameLabel.text = "Jeremy Buell"
        titleLabel.text = "GOAT, Dad, Padre, Gramps"
        ageLabel.text = "Age: 49"
        
        profileImageView.image = UIImage(named: "KidneyPhoto")
        
        bioLabel.text = "Bio: I am a father to 5.  Four daughters and one son.  I received a Kidney Transplant from my son on Dec 22, 2020 (Quite the Christmas gift!!!).  I am feeling healthy and ready to attack the world.  I have worked in IT for 20+ years with a background in Networking and DataCenters and have decided to enhance my experience with iOS Development with the hopes of doing that as my next career.  So far so good..."
    }
}
