//
// PlanetListTableViewController.swift
// SolarSystem_DM
//


import UIKit

class PlanetListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlanetController.planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        let planet = PlanetController.planets[indexPath.row]
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = planet.planetName
        cellContent.image = UIImage(named: planet.planetImageName.lowercased())
//        cell.textLabel?.text = planet.planetName
//        cell.imageView?.image = UIImage(named: planet.planetImageName.lowercased())
//        deprecated
        cell.contentConfiguration = cellContent
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Check for the correct segue
        if segue.identifier == "toDetailVC" {
            
            let destinationVC = segue.destination as? PlanetDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let planet = PlanetController.planets[indexPath.row]
            
            //Tells the planet data where to land (landing pad)
            destinationVC?.planet = planet
        }
    }
}
