//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Thomas Cowern New on 11/27/18.
//  Copyright © 2018 vetDevHouse. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {
    
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var diameterValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var lengthOfDayValue: UILabel!
    @IBOutlet weak var orbitalValue: UILabel!
    
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews(planet: planet)
        
    }

    func updateViews(planet: Planet?) {
        
        guard let planet = planet, self.isViewLoaded else { return }
        
        self.title = planet.name
        self.planetImage.image = UIImage(named: "\(planet.imageName)")
        self.diameterValue.text = "\(planet.diameter)"
        self.distanceValue.text = "\(planet.millionKMsFromSun)"
        self.lengthOfDayValue.text = "\(planet.dayLength)"
        self.orbitalValue.text = "\(planet.orbitalPeriod)"
//        if let planetName = planet?.name {
//            self.title = planetName
//        }
//        if let _ = planet?.imageName {
//            self.planetImage.image = UIImage(named: "\(planet?.imageName ?? "No Image Available")")
//        }
//        if let diameter = planet?.diameter {
//            self.diameterValue.text = "\(diameter)"
//        }
//        if let distance = planet?.millionKMsFromSun {
//            self.distanceValue.text = "\(distance)"
//        }
//        if let lengthOfDay = planet?.dayLength {
//            self.lengthOfDayValue.text = "\(lengthOfDay)"
//        }
//        if let orbitalPeriod = planet?.orbitalPeriod {
//            self.orbitalValue.text = "\(orbitalPeriod)"
//        }
    }

    
    
}
