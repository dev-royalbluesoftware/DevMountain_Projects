//
// Planet.swift
// SolarSystem_DM
//


import Foundation

class Planet {
    
    // MARK: - Properties
    
    let planetName: String
    let planetImageName: String
    let planetDiameter: Int
    let planetDayLength: Double
    let maxMillionKMsFromSun: Double
    
    // memberwise initializer
    init(planetName: String, planetImageName: String, planetDiameter: Int, planetDayLength: Double, maxMillionKMsFromSun: Double) {
        self.planetName = planetName
        self.planetImageName = planetImageName.lowercased()
        self.planetDiameter = planetDiameter
        self.planetDayLength = planetDayLength
        self.maxMillionKMsFromSun = maxMillionKMsFromSun
    }
}
