//
//  GameScene+PhysicsContactDelegate.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        switch contact.bodyA.categoryBitMask {
        case .playerCarCategory:
            contact.bodyB.node?.removeFromParent()
            hud.carTakeDamage()
        default:
            break
        }
    }
}
