//
//  CarPosition.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import UIKit

enum CarPosition: CaseIterable {
    case left, middle, right
    
    var position: CGPoint {
        let midX = UIScreen.main.bounds.midX
        let roadsSize: CGFloat = .widthValue(700) * 0.33
        switch self {
        case .left:
            return CGPoint(x: midX - roadsSize, y: .heightValue(50))
        case .middle:
            return CGPoint(x: midX, y: .heightValue(50))
        case .right:
            return CGPoint(x: midX + roadsSize, y: .heightValue(50))
        }
    }
    
    func left() -> Self {
        switch self {
        case .left:
            return .left
        case .middle:
            return .left
        case .right:
            return .middle
        }
    }
    
    func right() -> Self {
        switch self {
        case .left:
            return .middle
        case .middle:
            return .right
        case .right:
            return .right
        }
    }
}
