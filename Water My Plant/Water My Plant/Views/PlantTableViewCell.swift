//
//  PlantTableViewCell.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/26/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    var plant: Plant? {
        didSet {
            self.updateViews()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var waterStatusLabel: UILabel!
    
    // MARK: IBActions
    
    
    

    func updateViews() {
        guard let plant = plant else { return }
        
        plantImage.image = UIImage(data: plant.plantImageData)
        nicknameLabel.text = plant.nickname
        speciesLabel.text = plant.species
//        waterStatusLabel.text = 
        
    }

}
