//
//  PlantDetailViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    var plant: Plant?
    
    var plantController: PlantController?
    var themeHelper: ThemeHelper?
    weak var delegate: plantUpdateDelegate!
    
    // MARK: IBOutlets
    
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    @IBOutlet weak var waterRequirementsTextField: UITextField!
    @IBOutlet weak var sunlightRuquirementsTextField: UITextField!
    @IBOutlet weak var indoorOutdoorTextField: UITextField!
    
    // MARK: IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let plant = plant else { return }
        guard let controller = plantController else { return }
        if let waterfrequency = waterRequirementsTextField.text,
            let sunlightAmount = sunlightRuquirementsTextField.text,
            let indoorOrOutdoor = indoorOutdoorTextField.text,
            !waterfrequency.isEmpty,
            !sunlightAmount.isEmpty,
            !indoorOrOutdoor.isEmpty{
            
            controller.updatePlant(plant: plant, waterFrequency: waterfrequency, sunlightAmount: sunlightAmount, indoorOrOutdoor: indoorOrOutdoor)
            delegate.didUpdatePlant()
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        setTheme()
    }
    
    
    
    func updateViews() {
        guard let plant = plant else { return }
        
        self.title = plant.nickname
        
        speciesLabel.text = plant.species
        plantDetailImageView.image = UIImage(data: plant.plantImageData)
        waterRequirementsTextField.text = (plant.waterFrequency)
        sunlightRuquirementsTextField.text = (plant.sunlightAmount)
        indoorOutdoorTextField.text = (plant.indoorOrOutdoor)
        
    }
    
    
    func setTheme() {
        var preference = themeHelper.themePreference
        
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
    
    //MARK: Textfield Delegate
    
    // When user press the return key in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // It is called before text field become active
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.lightGray
        return true
    }

    // It is called when text field going to inactive
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.white
        return true
    }

    // It is called each time user type a character by keyboard
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

