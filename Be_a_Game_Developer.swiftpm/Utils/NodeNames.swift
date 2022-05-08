//
//  NodeNames.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 05/04/22.
//

import Foundation

/// Enum that contains the all nodes name
enum NodeName: String {
    case enemyCar
    case playerCar
    case yellowColumn
    case purpleColumn
    case redColumn
    
    var name: String {
        self.rawValue
    }
}
