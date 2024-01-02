//
// ShoppingItemListTableViewController.swift
// W2-D5_Assessment-ShoppingList
//


import UIKit

class ShoppingItemListTableViewController: UITableViewController {

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListItemController.sharedInstance.loadFromPersistenceStore()
    }
    
    // MARK: - Actions
    
    @IBAction func addItemAction(_ sender: Any) {
        // alert controller
        let alertController = UIAlertController(title: "New Shopping List Item", message: nil, preferredStyle: .alert)
        alertController.addTextField() { textField in
            textField.placeholder = "Item to buy..."
        }
        
        let doneAction = UIAlertAction(title: "Add Item", style: .default) { _ in
            guard let itemText = alertController.textFields?.last?.text, !itemText.isEmpty else { return }
            ListItemController.sharedInstance.createItem(itemTitle: itemText)
            
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(doneAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListItemController.sharedInstance.listItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as? ItemListTableViewCell else { return UITableViewCell() }
        let listItem = ListItemController.sharedInstance.listItems[indexPath.row]

        cell.item = listItem
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let itemToDelete = ListItemController.sharedInstance.listItems[indexPath.row]
            ListItemController.sharedInstance.deleteItem(item: itemToDelete)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

// MARK: - Extension ItemListCell Delegate

extension ShoppingItemListTableViewController: ItemListCellDelegate {
    func isCompletedTapped(for cell: ItemListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        
        let listItem = ListItemController.sharedInstance.listItems[indexPath.row]
        ListItemController.sharedInstance.toggleIsComplete(item: listItem)
        cell.updateViews(for: listItem)
    }
}
