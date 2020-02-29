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
    @IBOutlet weak var scrollView: UIScrollView!
    
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
                    if let nicknameText = plantNickname.text, let speciesText = plantSpecies.text, let waterText = waterFrequency.text, let sunlightText = sunlightNeed.text, let indoorOutdoor = indoorOrOutdoor.text,
                        !nicknameText.isEmpty, !speciesText.isEmpty, !waterText.isEmpty, !sunlightText.isEmpty, !indoorOutdoor.isEmpty,
                        let photoData = plantImage.image?.pngData() {
                        plantController.createPlant(nickname: nicknameText, species: speciesText, waterFrequency: waterText, sunlightAmount: sunlightText, indoorOrOutdoor: indoorOutdoor, plantImageData: photoData)
                        delegate?.plantWasCreated(plant)
                    }
                }
            } else {
                return
//                if let plantController = plantController {
//                    if let text = plantNickname.text, !text.isEmpty {
//                        let photoData = plantImage.image?.jpegData(compressionQuality: 1)
//
////                        plantController.create
//                    }
//                }
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
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
}
