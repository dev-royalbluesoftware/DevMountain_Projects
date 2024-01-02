//
// PlanetDetailViewController.swift
// SolarSystem_DM
//


import UIKit

class PlanetDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetDiameterLabel: UILabel!
    @IBOutlet weak var sunDistanceLabel: UILabel!
    @IBOutlet weak var lengthOfDaysLabel: UILabel!
    
    // MARK: - Properties

    var planet: Planet? // landing pad
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - Helper Functions
    
    func updateView() {
        guard let planet = planet else { return }

        planetNameLabel.text = planet.planetName
        planetImageView.image = UIImage(named: planet.planetImageName.lowercased())
        planetDiameterLabel.text = "\(planet.planetDiameter) km"
        sunDistanceLabel.text = "\(planet.maxMillionKMsFromSun) km"
        lengthOfDaysLabel.text = "\(planet.planetDayLength) Earth Days"
    }
}
