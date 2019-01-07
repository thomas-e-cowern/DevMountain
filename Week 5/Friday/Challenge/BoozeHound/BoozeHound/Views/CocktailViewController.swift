//
//  CocktailViewController.swift
//  BoozeHound
//
//  Created by Thomas Cowern New on 1/5/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var cocktailIngredientsLabel: UILabel!
    @IBOutlet weak var cocktailRecipeLabel: UILabel!
    
    // MARK: - Properties
    var cocktailBucket: CocktailBucket?
    var cocktailPicture: UIImage?
    var viewRecipe: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cocktailNameLabel.text = cocktailBucket?.name
        self.cocktailImageView.image = cocktailBucket?.image
        
        guard let cocktailBucket = cocktailBucket else { return }
        RecipeController.fetchRecipeInfo(with: cocktailBucket.id) { (recipe) in
            guard let recipe = recipe else { print("SHIT!!!!!!!!!"); return }
            self.viewRecipe = recipe.drinks[0].recipe
            let r = recipe.drinks[0]
            let mr = Mirror(reflecting: r)
            var ingredients: [String] = []
            for (_, k) in mr.children.enumerated() {
                if let property = k.value as? String {
                    ingredients.append(property)
                } else {
                    print("Problem appending ingredient")
                }
            }
            let cleanIngredients = ingredients.filter{ $0 != ""}.filter{$0 != " "}.filter{$0 != "\n"}
//            let cutIngredients = cleanIngredients[2..<cleanIngredients.count]
//            let start = cutIngredients.count
            let doneIngredients = Array(cleanIngredients[2...((cleanIngredients.count)/2)])
            let doneMeasures = Array(cleanIngredients[(cleanIngredients.count-doneIngredients.count)..<cleanIngredients.count])
            var ingredientDict = [String:String]()
            for (index, value) in doneIngredients.enumerated() {
                ingredientDict[value]=doneMeasures[index]
            }
//            print(ingredientDict)
            
            var stringIngredients: String = ""
            
            for (key, value) in ingredientDict {
                print("\(key): \(value)")
                stringIngredients = stringIngredients + "\(key): \(value)\n"
            }
           
            DispatchQueue.main.async {
                self.cocktailRecipeLabel.text = self.viewRecipe
                self.cocktailIngredientsLabel.text = stringIngredients
            }
        }
        
    }
}
