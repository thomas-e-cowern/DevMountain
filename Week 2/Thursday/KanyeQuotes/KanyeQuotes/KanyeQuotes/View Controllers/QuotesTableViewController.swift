//
//  QuotesTableViewController.swift
//  KanyeQuotes
//
//  Created by Thomas Cowern New on 12/6/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit
import CoreData

class QuotesTableViewController: UITableViewController {
    
    
    let fetchResultsController: NSFetchedResultsController<Quote> = {
        let request: NSFetchRequest<Quote> = Quote.fetchRequest()
        let quoteSortDescriptor = NSSortDescriptor(key: "isKanyeQuote", ascending: true)
        request.sortDescriptors = [quoteSortDescriptor]
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try fetchResultsController.performFetch()
        } catch  {
            print("😡 There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
        }
        fetchResultsController.delegate = self
    }
    
    
    @IBAction func newQuoteButtonTapped(_ sender: Any) {
        presentQuoteAlert()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kanyeView", for: indexPath) as! KanyeTableViewCell
        cell.delegate = self
        let quote = fetchResultsController.object(at: indexPath)
        cell.quote = quote
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let quote = fetchResultsController.object(at: indexPath)
            QuoteController.shared.delete(quote: quote)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as! QuoteDetailViewController
            let quote = fetchResultsController.object(at: indexPath)
            destinationVC.quote = quote
        }
    }
}

extension QuotesTableViewController: KanyeTableViewCellDelegate {
    func cellButtonTapped(_ cell: KanyeTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let quote = fetchResultsController.object(at: indexPath)
            QuoteController.shared.toggle(quote: quote)
            cell.toggleCell(with: quote)
        }
    }
    
    
}

extension QuotesTableViewController: NSFetchedResultsControllerDelegate {
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

extension QuotesTableViewController {
    func presentQuoteAlert() {
        let alertController = UIAlertController(title: "Quote", message: "Enter a Kanye quoe", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter your quote here"
        }
        let addAction = UIAlertAction(title: "add", style: .default) { (_) in
            guard let textField = alertController.textFields?.first else { return }
            QuoteController.shared.createQuote(with: textField.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
}
