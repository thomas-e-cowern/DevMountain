//
//  TokTableViewController.swift
//  TikTok2
//
//  Created by Thomas Cowern New on 1/3/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import CloudKit

class TokTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TokController.shared.fetchAllToks { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func composeButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Tok", message: "Add Tok You Jerk", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Get Tokky"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Don't get Tokky"
        }
        
        let tokAction = UIAlertAction(title: "Tok Away", style: .default) { (_) in
            
            guard let title = alertController.textFields?[0].text,
                let text = alertController.textFields?[1].text else { return }
            TokController.shared.birthYoungTok(title: title, text: text, completion: { (tok) in
                if tok != nil {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            })
        }
        
        let tikAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(tokAction)
        alertController.addAction(tikAction)
        
        present(alertController, animated: true)
        
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        TokController.shared.fetchAllToks { (_) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func refreshPulled(_ sender: Any) {
        TokController.shared.fetchAllToks { (_) in
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
                
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TokController.shared.toks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tokCell", for: indexPath)
        let tok = TokController.shared.toks[indexPath.row]
        cell.textLabel?.text = tok.text
        cell.detailTextLabel?.text = tok.title
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let tok = TokController.shared.toks[indexPath.row]
            TokController.shared.delete(tok: tok) { (success) in
                if success {
                    DispatchQueue.main.async {
                        TokController.shared.toks.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let sharedContextualAction = UIContextualAction(style: .normal, title: "Share") { (action, view, nil) in
            print("Attemping to share entry")
            // create the cloud sharing container
            let cloudSharingController = UICloudSharingController {(controller, completion: @escaping (CKShare?, CKContainer?, Error?) -> Void) in
                let tok = TokController.shared.toks[indexPath.row]
                TokController.shared.createShare(with: tok, completion: completion)
            }
            
            if let popover = cloudSharingController.popoverPresentationController {
                popover.backgroundColor = .yellow
            }
            DispatchQueue.main.sync {
                self.present(cloudSharingController, animated: true)
            }
            
        }
        
        sharedContextualAction.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        
        let configuration = UISwipeActionsConfiguration(actions: [sharedContextualAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTok" {
            if let destinationVC = segue.destination as? ViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let tok = TokController.shared.toks[indexPath.row]
                    destinationVC.tok = tok
                    
                }
            }
        }
    }
    
    
}
