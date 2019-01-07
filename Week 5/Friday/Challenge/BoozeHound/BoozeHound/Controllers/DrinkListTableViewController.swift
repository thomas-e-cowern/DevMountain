//
//  DrinkListTableViewController.swift
//  BoozeHound
//
//  Created by Thomas Cowern New on 1/4/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class DrinkListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cocktailSearchBar: UISearchBar!
    
    // MARK: - Properties
    var cocktails: [Cocktail] = []
    
    var cocktailImages: [UIImage] = []
    
    var cocktailBucket = [CocktailBucket]()
    
    // View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cocktailSearchBar.delegate = self
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! CocktailListTableViewCell
        let cocktail = cocktails[indexPath.row]
        CocktailController.fetchCocktailImage(cocktail) { (image) in
            if let image = image{
                self.cocktailBucket.append(CocktailBucket(name: cocktail.name, id: cocktail.id, image: image))
                
                //                DispatchQueue.main.async {
                //                    cell.cocktailImage.image = image
                //                }
//                self.cocktailImages.append(image)
            } else {
//                self.cocktailImages.append(UIImage(named: "noImage")!)
                self.cocktailBucket.append(CocktailBucket(name: cocktail.name, id: cocktail.id, image: UIImage(named: "noImage")!))
            }
            DispatchQueue.main.async {
                cell.cocktailImage.image = self.cocktailBucket[indexPath.row].image
                cell.cocktailNameLabel.text = self.cocktailBucket[indexPath.row].name
            }
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailView" {
            if let destinationVC = segue.destination as? CocktailViewController {
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
//                let cocktail = cocktails[indexPath.row]
                
                //                DispatchQueue.main.async {
//                destinationVC.cocktailPicture = self.cocktailImages[indexPath.row]
//                destinationVC.cocktail = cocktail
                //                    destinationVC.cocktailIngredientsLabel.text = self.viewRecipe
                //                }
//                destinationVC.cocktailPicture = cocktailBucket[indexPath.row].image
//                destinationVC.cocktailNameLabel.text = cocktailBucket[indexPath.row].name
                destinationVC.cocktailBucket = cocktailBucket[indexPath.row]
                destinationVC.title = cocktailBucket[indexPath.row].name
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
}

extension DrinkListTableViewController: UISearchBarDelegate {
    //    func getCocktailImages(completion: @escaping (Bool) -> Void) {
    //        for cocktail in cocktails {
    //            CocktailController.fetchCocktailImage(cocktail) { (image) in
    //                if let image = image {
    //                    self.cocktailImages.append(image)
    //                    completion(true)
    //                } else {
    //                    self.cocktailImages.append(UIImage(named: "noImage")!)
    //                    completion(false)
    //                    return
    //                }
    //            }
    //        }
    //    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchTerm = searchBar.text ?? ""
        
        CocktailController.fetchCocktailResults(with: searchTerm) { (cocktails) in
            guard let cocktails = cocktails else { return }
            self.cocktails = cocktails
            //            self.getCocktailImages(completion: { (success) in
            //                if success {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //                }
            //            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        cocktailSearchBar.text = ""
        DispatchQueue.main.async {
            self.cocktails = []
            self.tableView.reloadData()
        }
    }
}
