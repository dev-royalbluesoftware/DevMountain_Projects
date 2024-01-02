//
//  DayDetailViewController.swift
//  daysOfTheWeek
//
//  Created by Jeremy Buell on 4/15/21.
//

import UIKit

///ViewController for our DayDetailView
class DayDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var dayOriginLabel: UILabel!
    
    // MARK: - Properties
    /**
     Optional Day object
     
     `day` is a stored property. This Day object will receive a value if, and only if, the `prepareForSegue` method on our tableViewController is triggered (run)
     */
    var day: Day?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    // MARK: - Update Functions
    
    func updateView() {
        
        ///Check to make sure that *day* has a value. Create a new constant, `day`
        guard let day = day else { return }
        
        //Set the text properties of our labels, using the properties of the day object
        dayNameLabel.text = day.name
        dayOriginLabel.text = day.origin
    }
}
