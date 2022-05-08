//
//  AnchorPositions.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 05/04/22.
//

import Foundation
import CoreGraphics

/// Enum that contains the most used anchor point positions
enum AnchorPosition {
    case center, centerTop, centerBottom, centerLeading, centerTrailing
    case topLeading, topTrailing
    case bottomLeading, bottomTrailing
    
    var position: CGPoint {
        switch self {
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .topLeading:
            return CGPoint(x: 0.0, y: 1.0)
        case .topTrailing:
            return CGPoint(x: 1.0, y: 1.0)
        case .bottomLeading:
            return CGPoint(x: 0.0, y: 0.0)
        case .bottomTrailing:
            return CGPoint(x: 1.0, y: 0.0)
        case .centerTop:
            return CGPoint(x: 0.5, y: 1.0)
        case .centerBottom:
            return CGPoint(x: 0.5, y: 0.0)
        case .centerLeading:
            return CGPoint(x: 0.0, y: 0.5)
        case .centerTrailing:
            return CGPoint(x: 1.0, y: 0.5)
        }
    }
}
