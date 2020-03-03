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
        super.viewWillAppear(animated)
        setTheme()
        tableView.reloadData()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("ViewDidLoad was called")
        setTheme()
         tableView.reloadData()
        tableView.tableFooterView = UIView()
            
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"Blue Rose")!)
         UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "Blue Rose")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
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
            }
        }   else if segue.identifier == "ThemeSelectionSegue" {
                guard let themeVC = segue.destination as? ThemeSelectionViewController else { return }
                themeVC.themeHelper = themeHelper
            }
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
        
    }
    





    
