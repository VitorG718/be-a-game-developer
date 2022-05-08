//
//  ProgrammingCardData.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import Foundation
import CoreGraphics

struct ProgrammingCardContent {
    let text: String
    let order: Int
}

struct ProgrammingCardData {
    enum CardType {
        case object, color, position
        
        var cardSize: CGSize {
            switch self {
            case .object, .color:
                return CGSize(width: .widthValue(116), height: .heightValue(70))
            case .position:
                return CGSize(width: .widthValue(116), height: .heightValue(64))
            }
        }
    }
    
    enum Error {
        case cardNotSupported(String)
        case wrongSequence(String)
    }
    
    let content: ProgrammingCardContent
    let type: CardType
    let imageName: ImageName
    let initialPosition: CGPoint
}
