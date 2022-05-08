//
//  ColumnGuide.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import Foundation
import SpriteKit

struct ColumnGuide {
    let columnNode: SKSpriteNode
    let initialPosition: CGPoint
    var lastPosition: CGPoint
    var cardsAdded = [ProgrammingCard]()
    let columnName: NodeName
    let title: String
}
