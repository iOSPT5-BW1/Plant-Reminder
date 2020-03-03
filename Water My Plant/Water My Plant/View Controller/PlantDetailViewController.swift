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
    
    // MARK: IBOutlets
    @IBOutlet weak var plantNicknameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var optimalConditionsTextView: UITextView!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
    }
      

    func updateViews() {
        print("\(plant)")
        guard let plant = plant else { return }
        
            plantNicknameLabel.text = plant.nickname
            speciesLabel.text = plant.species
            plantDetailImageView.image = UIImage(data: plant.plantImageData)
            optimalConditionsTextView.text = "Water \(plant.waterFrequency). \n Requires \(plant.sunlightAmount) sunlight. \n \(plant.indoorOrOutdoor) plant."
    }
    
}
