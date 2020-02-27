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
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
            if let plant = plant {
                if let plantController = plantController {
                    if let text = plantNickname.text, !text.isEmpty, let photoData = plantImage.image?.pngData() {
                        plantController.update
                    }
                }
            } else {
                if let plantController = plantController {
                    if let text = plantNickname.text, !text.isEmpty {
                        let photoData = plantImage.image?.jpegData(compressionQuality: 1)
                        
                        plantController.create
                    }
                }
            }
            navigationController?.popViewController(animated: true)
        }

//        guard let name = plantNickname.text,
//            let species = plantSpecies.text,
//            !name.isEmpty,
//            !species.isEmpty else { return }
//
//        let imageData = plantImage.image?.pngData()
//
//        var plant = Plant(nickname: name, species: species, plantImage: UIImage?(data: imageData))
//
//        delegate?.plantWasCreated(plant)
//        self.dismiss(animated: true, completion: nil)
//    }
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
    
    // MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //    }
}
