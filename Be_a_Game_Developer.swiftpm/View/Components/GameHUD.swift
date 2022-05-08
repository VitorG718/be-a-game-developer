//
//  GameHUD.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SpriteKit

final class GameHUD: SKNode {
    
    private let LIFE_MAX_VALUE: CGFloat = 430
    private var lifeBarMask: SKSpriteNode!
    var zeroLifeValueAction: () -> Void = { }
    
    private let SHIELD_MAX_VALUE: CGFloat = 394
    private var shieldBarMask: SKSpriteNode!
    private var hasShield: Bool = false
    private var canUpdateShieldValue: Bool = true
    
    private let screenSize = UIScreen.main.bounds.size
    
    override init() {
        super.init()
        
        configureLifeBar()
        configureShield()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLifeBar() {
        let lifeBarSize = CGSize(width: .widthValue(532), height: .heightValue(100))
        let lifeBar = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.lifeBar.name),
                                   size: lifeBarSize)
        lifeBar.anchorPoint = AnchorPosition.topLeading.position
        lifeBar.position = CGPoint(x: .widthValue(30),
                                   y: screenSize.height - CGFloat.heightValue(45))
        addChild(lifeBar)
        let lifeBarMaskSize = CGSize(width: .widthValue(0), height: .heightValue(40))
        lifeBarMask = SKSpriteNode(color: .white, size: lifeBarMaskSize)
        lifeBarMask.anchorPoint = AnchorPosition.topTrailing.position
        lifeBarMask.position = CGPoint(x: lifeBar.frame.maxX - CGFloat.widthValue(2),
                                       y: lifeBar.frame.maxY - CGFloat.heightValue(3))
        addChild(lifeBarMask)
    }
    
    private func configureShield() {
        let shieldSize = CGSize(width: .widthValue(60), height: .heightValue(400))
        let shieldBar = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.shieldBar.name), size: shieldSize)
        shieldBar.anchorPoint = AnchorPosition.centerTrailing.position
        shieldBar.position = CGPoint(x: screenSize.width - CGFloat.widthValue(55),
                                     y: screenSize.height * 0.55)
        addChild(shieldBar)
        
        let shieldMaskSize = CGSize(width: .widthValue(52), height: .heightValue(394))
        shieldBarMask = SKSpriteNode(color: .white, size: shieldMaskSize)
        shieldBarMask.anchorPoint = AnchorPosition.centerTop.position
        shieldBarMask.size.height = .heightValue(SHIELD_MAX_VALUE)
        shieldBarMask.position = CGPoint(x: shieldBar.frame.midX,
                                         y: shieldBar.frame.maxY - CGFloat.heightValue(3))
        addChild(shieldBarMask)
    }
    
    // MARK: - Updates
    
    func carTakeDamage() {
        if lifeBarMask.size.width < CGFloat.widthValue(LIFE_MAX_VALUE) {
            if !hasShield {
                var newWidth = lifeBarMask.size.width + CGFloat.widthValue(LIFE_MAX_VALUE * 0.1)
                if newWidth > CGFloat.widthValue(LIFE_MAX_VALUE) {
                    newWidth = CGFloat.widthValue(LIFE_MAX_VALUE) 
                }
                lifeBarMask.run(.resize(toWidth: newWidth, duration: 0.8))
                if newWidth >= CGFloat.widthValue(LIFE_MAX_VALUE) {
                    zeroLifeValueAction()
                }
            }
            resetShieldBarValue()
        } else {
            zeroLifeValueAction()
        }
    }
    
    func incrementShieldBarValue() {
        guard canUpdateShieldValue else { return }
        
        if shieldBarMask.size.height > 0.0 {
            var newHeight = shieldBarMask.size.height - CGFloat.heightValue(SHIELD_MAX_VALUE * 0.1)
            if newHeight < 0.0 {
                newHeight = 0.0
            }
            shieldBarMask.run(.resize(toHeight: newHeight, duration: 0.8))
        } else {
            hasShield = true
        }
    }
    
    func resetShieldBarValue() {
        canUpdateShieldValue = false
        shieldBarMask.removeAllActions()
        shieldBarMask.size.height = CGFloat.heightValue(SHIELD_MAX_VALUE)
        hasShield = false
        self.canUpdateShieldValue = true
    }
    
    func fillLifeBar() {
        lifeBarMask.run(.resize(toWidth: 0.0, duration: 1.0))
    }
}
