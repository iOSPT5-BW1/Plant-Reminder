//
//  ThemeHelper.swift
//  Water My Plant
//
//  Created by Elizabeth Thomas on 3/2/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation


class ThemeHelper {
    
    private let themePreferenceKey = "themePreference"
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToLight() {
        UserDefaults.standard.set("Light", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        UserDefaults.standard.set("Green", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToPink() {
        UserDefaults.standard.set("Pink", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToOrange() {
        UserDefaults.standard.set("Orange", forKey: themePreferenceKey)
    }
    
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToLight()
        }
    }
    
}
