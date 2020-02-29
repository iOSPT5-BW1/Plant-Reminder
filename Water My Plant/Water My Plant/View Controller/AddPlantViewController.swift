//
//  AddPlantViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

protocol AddPlantDelegate {
    func plantWasCreated(_ plant: Plant)
}

class AddPlantViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    var plant: Plant?
    var plantController: PlantController?
    var delegate: AddPlantDelegate?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantNickname: UITextField!
    @IBOutlet weak var plantSpecies: UITextField!
    @IBOutlet weak var waterFrequency: UITextField!
    @IBOutlet weak var sunlightNeed: UITextField!
    @IBOutlet weak var indoorOrOutdoor: UITextField!
    
    // MARK: IBACtions
    
    @IBAction func addPhotoTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
               imagePicker.allowsEditing = true
               imagePicker.delegate = self
               present(imagePicker, animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        guard let plantController = plantController else { return }
                    if let nicknameText = plantNickname.text,
                        let speciesText = plantSpecies.text,
                        let waterText = waterFrequency.text,
                        let sunlightText = sunlightNeed.text,
                        let indoorOutdoor = indoorOrOutdoor.text,
                        !nicknameText.isEmpty,
                        !speciesText.isEmpty,
                        !waterText.isEmpty,
                        !sunlightText.isEmpty,
                        !indoorOutdoor.isEmpty,
                        let photoData = plantImage.image?.pngData() {
                        plantController.createPlant(nickname: nicknameText, species: speciesText, waterFrequency: waterText, sunlightAmount: sunlightText, indoorOrOutdoor: indoorOutdoor, plantImageData: photoData)
//                        delegate?.plantWasCreated(plant)
                    } else {
                return
            }
        navigationController?.popViewController(animated: true)
        }

    func updateViews() {
           guard let plant = plant else { return }
           plantImage.image = UIImage(data: plant.plantImageData)
            plantNickname.text = plant.nickname
            plantSpecies.text = plant.species
       }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       guard let image = info[.originalImage] as? UIImage else {
           print("No Image found")
           return }
           plantImage.image = image
           dismiss(animated: true, completion: nil)
   }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}
