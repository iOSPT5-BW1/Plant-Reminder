//
//  Plant.swift
//  Water My Plant
//
//  Created by Breena Greek on 2/26/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation
import UIKit


struct Plant: Codable, Equatable {
    var nickname: String
    var species: String
    var waterFrequency: String? = nil
    var sunlightAmount: String? = nil
    var indoorOrOutdoor: String? = nil
    var plantImageData: Data
}
