//
//  PlantDetailViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController, UITextFieldDelegate {
    
    var plant: Plant?
    let plantController = PlantController()
    var themeHelper: ThemeHelper?
    
    // MARK: IBOutlets
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    @IBOutlet weak var waterRequirementsTextField: UITextField!
    @IBOutlet weak var sunlightRuquirementsTextField: UITextField!
    @IBOutlet weak var indoorOutdoorTextField: UITextField!
    
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
            waterRequirementsTextField.text = "Water every \(plant.waterFrequency)."
            sunlightRuquirementsTextField.text = "Requires \(plant.sunlightAmount) sunlight."
            indoorOutdoorTextField.text = "\(plant.indoorOrOutdoor) plant."
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
    //MARK: Textfield Delegate
    // When user press the return key in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          setTheme()
      }

    // It is called before text field become active
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.lightGray
    return true
    }

    // It is called when text field activated
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    // It is called when text field going to inactive
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.white
    return true
    }

    // It is called when text field is inactive
    func textFieldDidEndEditing(_ textField: UITextField) {
    }

    // It is called each time user type a character by keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print(string)
    return true
    }
}
