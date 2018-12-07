//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Thomas Cowern New on 12/7/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController {
    
    // MARK: - Lifecycle...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
        fetchedResultsController.delegate = self
    }
    
    // Setting up the "Truth..."
    let fetchedResultsController: NSFetchedResultsController<ShoppingList> = {
        let request: NSFetchRequest<ShoppingList> = ShoppingList.fetchRequest()
        request.sortDescriptors = []
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! ShoppingListTableViewCell
        cell.delegate = self
        let shoppingList = fetchedResultsController.object(at: indexPath)
            cell.shoppingList = shoppingList
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let shoppingList = fetchedResultsController.object(at: indexPath)
            ShoppingListController.shared.deleteItem(shoppingList: shoppingList)
        }
    }
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        presetShoppingListAlert()
    }
}

// MARK: - Extensions
extension ShoppingListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .move:
            guard let oldIndexPath = indexPath, let newIndexPath = newIndexPath else { return }
            tableView.moveRow(at: oldIndexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ShoppingListTableViewController {
    func presetShoppingListAlert() {
        let alertController = UIAlertController(title: "Shopping List", message: "Enter a shopping list item to buy", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter a shopping list item"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let textField = alertController.textFields?.first else { return }
            ShoppingListController.shared.addItem(name: textField.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}

extension ShoppingListTableViewController: ShoppingListTableViewCellDelegate {
    func shoppingListButtonTapped(_ cell: ShoppingListTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let shoppingList = fetchedResultsController.object(at: indexPath)
            ShoppingListController.shared.toggle(shoppingList: shoppingList)
            cell.toggleButton(with: shoppingList)
        }
    }
}
