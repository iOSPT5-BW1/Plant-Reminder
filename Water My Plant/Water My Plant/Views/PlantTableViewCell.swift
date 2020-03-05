//
//  PlantTableViewCell.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/26/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

import UserNotifications

class PlantTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    var plant: Plant? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: IBOutlets
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var needsWaterButton: UIButton!
    
    // MARK: IBActions
    
    @IBAction func needsWater(_ sender: UIButton) {
        
        if !needsWaterButton.isHidden {
            needsWaterButton.isHidden = true
            Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(showLabel), userInfo: nil, repeats: false)
        }
        guard let nicknameLabel = nicknameLabel.text else { return }
        let content = UNMutableNotificationContent()
        content.title = "Your plant is thirsty!"
        content.subtitle = "It's time to water \(nicknameLabel)!"
        content.body = "Make sure you water your plant today!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
        
        let request = UNNotificationRequest(identifier: "TimerUp", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    @objc func showLabel() {
        needsWaterButton.isHidden = false
    }
    
    private func updateViews() {
        guard let plant = plant else { return }
        
        plantImage.image = UIImage(data: plant.plantImageData)
        plantImage.setRounded()
        nicknameLabel.text = plant.nickname
        speciesLabel.text = plant.species
        
    }
    
}
extension UIImageView {

   func setRounded() {
    let radius = self.frame.width / 2
      self.layer.cornerRadius = radius
      self.layer.masksToBounds = true
   }
}

