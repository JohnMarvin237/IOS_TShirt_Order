//
//  Item.swift
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKO
//
//  Created by John Marvin NDEKEBITIK HELIANG on 2025-02-10.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
