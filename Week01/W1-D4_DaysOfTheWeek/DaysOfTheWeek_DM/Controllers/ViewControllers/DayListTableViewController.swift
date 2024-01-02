//
//  DayListTableViewController.swift
//  daysOfTheWeek
//
//  Created by Jeremy Buell on 4/15/21.
//  most comments copied from mentor project...

import UIKit

///ViewController for our DayListTableView
class DayListTableViewController: UITableViewController {

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///We get the count of the *daysOfTheWeek* array on the DayController, and return that value as the value for the number of rows that we want. (number of rows is determinded by the number of objects in the array.)
        return DayController.daysOfTheWeek.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///The identifier given here must match the reuseIdentifier on our storyboard
        //Reuse the same cells to save memory, they are dequeued and reused.
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)

        ///Grab a day object from the *daysOfTheWeek* array. We use the index of the currently considered cell and get the object at the corresponding index on the source of truth array (daysOfTheWeek)
        //`subscript`
        let day = DayController.daysOfTheWeek[indexPath.row]
        
        ///Grab the name property of the day object and assign it to the text property of the text label on the cell
        var cellContent = cell.defaultContentConfiguration()
        cellContent.text = day.name
//        cell.textLabel?.text = day.name // deprecated version
        cell.contentConfiguration = cellContent
        
        print("The \(indexPath.row + 1) cell was created, and the day \(day.name), at the \(indexPath.row) index on the SOT was used")

        return cell
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        //Identifier, Index, Destination, Object to send, Object to recieve
        
        //Make sure that we are on the correct segue
        if segue.identifier == "toDetailVC" {
            
            //get the index of the selected cell
            if let index = tableView.indexPathForSelectedRow {
                
                //Tell the segue what to expect at the end of the tunnel (give the segue a blueprint for how to interpret the data at the destination)
                //`as?` optional casting
                guard let destinationVC = segue.destination as? DayDetailViewController else {return}
                
                //the object that we are sending - the day for the row that was selected (grab the object on the source of truth that corresponds to the selected index -- see line 32)
                let dayToSend = DayController.daysOfTheWeek[index.row]
                
                //Tell the data where to land (assign to a landing pad)
                destinationVC.day = dayToSend
            }
        }
    }
}
