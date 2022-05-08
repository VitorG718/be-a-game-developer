//
//  GameScene.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 05/04/22.
//

import SpriteKit
import SwiftUI

final class GameScene: SKScene, GameViewModelDelegate {
    
    private(set) lazy var hud: GameHUD = {
        let hud = GameHUD()
        hud.zeroLifeValueAction = { [weak self] in
            self?.carNode?.removeFromParent()
            self?.removeAllActions()
            self?.sceneDelegate?.endGame()
        }
        return hud
    }()
    private var carNode: SKSpriteNode?
    private var carPosition: CarPosition = .middle
    private var duration: TimeInterval = 1.2
    weak var sceneDelegate: GameSceneDelegate?
    
    override func sceneDidLoad() {
        backgroundColor = UIColor(Color(ColorName.background.name))
        
        createRoads()
        carNode = setupCar(withPosition: .middle)
        
        addChild(hud)
        physicsWorld.contactDelegate = self
    }
    
    func createEnemyAction(duration: TimeInterval, completion: (() -> Void)? = nil) -> SKAction {
        let screenSize = UIScreen.main.bounds.size
        
        let action = SKAction.sequence([
            .wait(forDuration: duration),
            .run {
                let enemy = self.createEnemy()
                enemy.run(SKAction.moveTo(y: -(screenSize.height * 0.1), duration: duration * 1.5)) {
                    enemy.removeFromParent()
                }
                self.addChild(enemy)
                completion?()
            }
        ])
        
        return action
    }
    
    private func recursive() {
        guard duration > 0.5 else {
            let action = createEnemyAction(duration: duration)
            run(.repeatForever(action))
            return
        }
        
        let action = createEnemyAction(duration: duration) {
            self.duration -= 0.01
            self.recursive()
        }
        
        run(action)
    }
    
    private func updateShieldValue() {
        let sequence = SKAction.sequence([
            .wait(forDuration: 1.0),
            .run {
                self.hud.incrementShieldBarValue()
            }
        ])
        run(.repeatForever(sequence))
    }
    
    // MARK: - GameViewModelDelegate
    
    func moveCarToLeft() {
        carPosition = carPosition.left()
        carNode?.position = carPosition.position
    }
    
    func moveCarToRight() {
        carPosition = carPosition.right()
        carNode?.position = carPosition.position
    }
    
    func startGame() {
        self.recursive()
        self.updateShieldValue()
    }
    
    func resetGame() {
        carPosition = .middle
        let childrenToRemove = children.filter({ $0.name == NodeName.playerCar.name || $0.name == NodeName.enemyCar.name })
        removeChildren(in: childrenToRemove)
        carNode = setupCar(withPosition: .middle)
        hud.fillLifeBar()
        duration = 1.2
    }
}
