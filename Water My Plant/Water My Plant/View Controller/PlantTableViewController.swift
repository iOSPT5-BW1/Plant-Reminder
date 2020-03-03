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
    var plantController = PlantController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlantModalSegue" {
            guard let addPlantVC = segue.destination as? AddPlantViewController else { return }
            addPlantVC.plantController = plantController
        } else if segue.identifier == "PlantDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? PlantDetailViewController {
                detailVC.plant = plantController.plants[indexPath.row]
            } else if segue.identifier == "ThemeSelectionSegue" {
                let themeVC = segue.destination as? ThemeSelectionViewController
                themeVC?.themeHelper = themeHelper
            }
        }
        
    }
    
}




    
