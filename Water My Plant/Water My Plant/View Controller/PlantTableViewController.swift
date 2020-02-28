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
    var plants: [Plant] = []
    
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
        return plants.count    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? PlantTableViewCell else { return UITableViewCell() }

        let plant = plants[indexPath.row]
        cell.plant = plant
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            plants.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlantModalSegue" {
            let addPlantVC = segue.destination as! AddPlantViewController
            
            addPlantVC.delegate = self
    
        }
    }
}

extension PlantTableViewController: AddPlantDelegate {
    func plantWasCreated(_ plant: Plant) {
        plants.append(plant)
        tableView.reloadData()
    }
}



    
