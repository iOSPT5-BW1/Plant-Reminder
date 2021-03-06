//
//  PlantController.swift
//  Water My Plant
//
//  Created by Elizabeth Thomas on 2/26/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation
import UIKit

protocol plantUpdateDelegate: class {
    func didUpdatePlant()
}

class PlantController {
    
    var plants: [Plant] = []
    
    func createPlant(nickname: String, species: String?, waterFrequency: String, sunlightAmount: String, indoorOrOutdoor: String, plantImageData: Data) {
        let plant = Plant(nickname: nickname, species: species, waterFrequency: waterFrequency, sunlightAmount: sunlightAmount, indoorOrOutdoor: indoorOrOutdoor, plantImageData: plantImageData)
        plants.append(plant)
        saveToPersistentStore()
    }
    
    func updatePlant(plant: Plant, waterFrequency: String, sunlightAmount: String, indoorOrOutdoor: String) {
        if let index = plants.firstIndex(of: plant) {
            plants[index].waterFrequency = waterFrequency
            plants[index].sunlightAmount = sunlightAmount
            plants[index].indoorOrOutdoor = indoorOrOutdoor
            saveToPersistentStore()
        }
    }
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("plants.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(plants)
            try data.write(to: url)
        } catch {
            print("Error saving plant data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            plants = try decoder.decode([Plant].self, from: data)
        } catch {
            print("Error loading plant data: \(error)")
        }
    }
}
