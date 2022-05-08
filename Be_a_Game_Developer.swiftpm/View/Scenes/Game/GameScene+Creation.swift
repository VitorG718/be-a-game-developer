//
//  GameScene+Creation.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SpriteKit

extension GameScene {
    
    func createRoads() {
        let roadsSize = CGSize(width: .widthValue(700), height: .heightValue(834))
        let roadsNode = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.roads.name), size: roadsSize)
        roadsNode.anchorPoint = AnchorPosition.centerBottom.position
        roadsNode.position = CGPoint(x: frame.midX, y: 0)
        addChild(roadsNode)
    }
    
    func setupCar(withPosition carPosition: CarPosition) -> SKSpriteNode {
        let carNode = createCar(imageName: .playerCar, nodeName: .playerCar)
        carNode.position = carPosition.position
        carNode.physicsBody?.categoryBitMask = .playerCarCategory
        carNode.physicsBody?.contactTestBitMask = .enemyCarCategory
        
        addChild(carNode)
        return carNode
    }
    
    func createEnemy() -> SKSpriteNode {
        let screenHeight = UIScreen.main.bounds.size.height
        let enemyPosition = CarPosition.allCases.randomElement() ?? .middle
        
        let node = createCar(imageName: .enemyCar, nodeName: .enemyCar)
        node.position = enemyPosition.position
        node.yScale *= -1
        node.position.y = screenHeight * 1.1
        node.name = NodeName.enemyCar.name
        node.physicsBody?.categoryBitMask = .enemyCarCategory
        
        return node
    }
    
    private func createCar(imageName: ImageName, nodeName: NodeName) -> SKSpriteNode {
        let nodeSize = CGSize(width: .widthValue(100), height: .heightValue(150))
        
        let node = SKSpriteNode(texture: SKTexture(imageNamed: imageName.name), size: nodeSize)
        node.anchorPoint = AnchorPosition.centerBottom.position
        node.name = nodeName.name
        
        let physicsBodyCenter = CGPoint(x: 0, y: nodeSize.height * 0.5)
        let physicsBody = SKPhysicsBody(rectangleOf: nodeSize, center: physicsBodyCenter)
        physicsBody.allowsRotation = false
        physicsBody.affectedByGravity = false
        physicsBody.categoryBitMask = .noneCategory
        physicsBody.contactTestBitMask = .noneCategory
        physicsBody.collisionBitMask = .noneCategory
        node.physicsBody = physicsBody
        
        return node
    }
}
