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
    var themeHelper = ThemeHelper()
    weak var delegate: plantUpdateDelegate!
    
    // MARK: IBOutlets
    
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var plantDetailImageView: UIImageView!
    @IBOutlet weak var waterRequirementsTextField: UITextField!
    @IBOutlet weak var sunlightRuquirementsTextField: UITextField!
    @IBOutlet weak var indoorOutdoorTextField: UITextField!
    @IBOutlet weak var OptimalConditionsLabel: UILabel!
    @IBOutlet weak var waterRequirementsLabel: UILabel!
    @IBOutlet weak var sunlightRequirmentsLabel: UILabel!
    @IBOutlet weak var indoorOutdoorLabel: UILabel!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
    }
    
    
    func setTheme() {
        let preference = themeHelper.themePreference
        
        if preference == "Light" {
            view.backgroundColor = .white
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Dark" {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.white.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Blue" {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.cyan.cgColor, UIColor.white.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Green" {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.green.cgColor, UIColor.white.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Pink" {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.magenta.cgColor, UIColor.white.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Orange" {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = self.view.bounds
            gradientLayer.colors = [UIColor.orange.cgColor, UIColor.white.cgColor]
            self.view.layer.insertSublayer(gradientLayer, at: 0)
            
            let color = UIColor.black
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
        } else if preference == "Plant" {
            UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "Plant")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
            
            let color = UIColor.white
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color]
            
            speciesLabel.textColor = color
            OptimalConditionsLabel.textColor = color
            waterRequirementsLabel.textColor = color
            sunlightRequirmentsLabel.textColor = color
            indoorOutdoorLabel.textColor = color
        }
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

