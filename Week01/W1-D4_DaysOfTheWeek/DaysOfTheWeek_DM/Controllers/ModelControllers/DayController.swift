//
// DayController.swift
// W1-D4_daysOfTheWeek
//


import Foundation

///Model Controller for the Day model
class DayController {
    
    /**
     Array of Day objects
     `daysOfTheWeek` is a computed property. A computed property is a property that gets its value from a function. Inside the scope here, we initialize seven Day objects, and return those objects as the value of the array
     
     `static` allows for global access
     */
    static var daysOfTheWeek: [Day] {
        let sunday = Day (name: "Sunday", origin: "Added to the Roman calendar by Emperor Constantine")
        let monday = Day(name: "Monday", origin: "Added to the Roman calendar by Emperor Constantine")
        let tuesday = Day(name: "Tuesday", origin: "Tuesday comes from Tiu, or Tiw, the Anglo-Saxon name for Tyr, the Norse god of war.")
        let wednesday = Day(name: "Wednesday", origin: "Odin, also known as Woden, the supreme deity after whom the Wednesday was named")
        let thursday = Day(name: "Thursday", origin: "Originates from Thor, the Norse god of thunder")
        let friday = Day(name: "Friday", origin: "Derived from Frigga, the wife of Odin, representing love and beauty")
        let saturday = Day(name: "Saturday", origin: "Saturn, the Roman god of fun and feasting")
        
        return [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
    }
}
