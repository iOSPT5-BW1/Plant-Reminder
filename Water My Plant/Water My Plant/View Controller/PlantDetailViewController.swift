//
//  PlantDetailViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController {
    
    var plant: Plant?
    let plantController = PlantController()
    var themeHelper: ThemeHelper?
    
    // MARK: IBOutlets
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var optimalConditionsTextView: UITextView!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
        setTheme()
    }
    
      

    func updateViews() {
        guard let plant = plant else { return }
        
        self.title = plant.nickname
        
            speciesLabel.text = plant.species
            plantDetailImageView.image = UIImage(data: plant.plantImageData)
            optimalConditionsTextView.text = "Water \(plant.waterFrequency). \n Requires \(plant.sunlightAmount) sunlight. \n \(plant.indoorOrOutdoor) plant."
    }
    
    func setTheme() {
        guard let preference = themeHelper?.themePreference else { return }
        
        if preference == "Light" {
            view.backgroundColor = .white
        } else if preference == "Dark" {
            view.backgroundColor = .darkGray
        } else if preference == "Blue" {
            view.backgroundColor = .blue
        } else if preference == "Green" {
            view.backgroundColor = .green
        } else if preference == "Pink" {
            view.backgroundColor = .systemPink
        } else if preference == "Orange" {
            view.backgroundColor = .orange
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          setTheme()
      }
}
