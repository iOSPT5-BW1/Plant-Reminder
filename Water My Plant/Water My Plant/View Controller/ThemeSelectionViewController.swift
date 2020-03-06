//
//  ThemeSelectionViewController.swift
//  Water My Plant
//
//  Created by Elizabeth Thomas on 3/2/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    @IBAction func lightThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToLight()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func darkThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func blueThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToBlue()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func greenThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToGreen()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func pinkThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToPink()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func orangeThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToOrange()
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func roseThemeTapped(_ sender: Any) {
        themeHelper?.setThemePreferenceToRose()
        navigationController?.popToRootViewController(animated: true)
    }
    
}
