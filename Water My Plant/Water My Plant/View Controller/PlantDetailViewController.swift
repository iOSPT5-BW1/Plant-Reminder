//
//  PlantDetailViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController {
    
    var plantController: PlantController?
    var plant: Plant?
    
    // MARK: IBOutlets
    @IBOutlet weak var plantNicknameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var optimalConditionsTextView: UITextView!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        plantNicknameLabel.text = plant?.nickname
        speciesLabel.text = plant?.species
        optimalConditionsTextView.text = """
        This plant should be watered \(plant?.waterFrequency).
        This plant requires \(plant?.sunlightAmount) sunlight.
        This plant is a(n) \(plant?.indoorOrOutdoor) plant.
"""
        self.title = plant?.nickname
    }
    
}
