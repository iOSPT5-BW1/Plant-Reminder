//
//  Plant.swift
//  Water My Plant
//
//  Created by Elizabeth Thomas on 2/26/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation
import UIKit

struct Plant: Codable, Equatable {
    var nickname: String
    var species: String
    var waterFrequency: String
    var sunlightAmount: String
    var indoorOrOutdoor: String
    var plantImageData: Data
}
