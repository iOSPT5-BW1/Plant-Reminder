//
//  PlantTableViewController.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/25/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class PlantTableViewController: UITableViewController {
    
    // MARK: Properties
    
    let reuseIdentifier = "PlantCell"
    let plantController = PlantController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantController.plants.count    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlantCell", for: indexPath) as? PlantTableViewCell else { return UITableViewCell() }

        
        let plant = plantController.plants[indexPath.row]
        cell.plant = plant
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            plantController.plants.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            plantController.saveToPersistentStore()
        }
    }
    
    // MARK: - Navigation
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let addPlantVC = AddPlantViewController()
        let navController = UINavigationController(rootViewController: addPlantVC)
        addPlantVC.delegate = self
        present(navController, animated: true)
    }
    
}

extension PlantTableViewController: AddPlantDelegate {
    func plantWasCreated(_ plant: Plant) {
        plantController.plants.append(plant)
        tableView.reloadData()
    }
}



    
