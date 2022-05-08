//
//  ProgrammingCard.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import SpriteKit

class ProgrammingCard: SKSpriteNode {
    
    private(set) var data: ProgrammingCardData
   
    init(data: ProgrammingCardData) {
        self.data = data
        super.init(texture: SKTexture(imageNamed: data.imageName.name),
                   color: .clear, size: data.type.cardSize)
        
        anchorPoint = AnchorPosition.centerTop.position
        position = data.initialPosition
        isUserInteractionEnabled = true
        
        let attributedString = NSAttributedString(string: data.content.text, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: .heightValue(13), weight: .semibold)
        ])
        let label = SKLabelNode(attributedText: attributedString)
        label.position = CGPoint(x: 0, y: -CGFloat.heightValue(32))
        label.numberOfLines = 0
        label.verticalAlignmentMode = .center
        label.horizontalAlignmentMode = .center
        addChild(label)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let firstTouch = touches.first else { return }
        guard let scene = scene else { return }
        position = firstTouch.location(in: scene)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let scene = scene as? ProgrammingScene {
            let node = scene.atPoint(position)
            switch node.name {
            case NodeName.yellowColumn.name:
                updateColumnGuide(&scene.yellowColumnGuide, scene: scene)
            case NodeName.purpleColumn.name:
                updateColumnGuide(&scene.purpleColumnGuide, scene: scene)
            case NodeName.redColumn.name:
                updateColumnGuide(&scene.redColumnGuide, scene: scene)
            default:
                position = data.initialPosition
            }
        }
    }
    
    private func updateColumnGuide(_ guide: inout ColumnGuide, scene: ProgrammingScene) {
        switch data.type {
        case .object:
            switch guide.columnName {
            case .yellowColumn where data.imageName == .yellowSnippet:
                fallthrough
            case .purpleColumn where data.imageName == .purpleSnippet:
                fallthrough
            case .redColumn where data.imageName == .redSnippet:
                position = guide.lastPosition
                guide.lastPosition.y = frame.minY + CGFloat.heightValue(6)
                guide.cardsAdded.append(self)
            default:
                cardNotSupported(guide, scene: scene)
            }
        case .color:
            if let last = guide.cardsAdded.last, last.data.type == .object {
                position = guide.lastPosition
                guide.lastPosition.y = frame.minY + CGFloat.heightValue(6)
                guide.cardsAdded.append(self)
            } else {
                cardNotSupported(guide, scene: scene)
            }
        case .position:
            if let last = guide.cardsAdded.last, last.data.type == .color {
                position = guide.lastPosition
                guide.lastPosition.y = frame.minY + CGFloat.heightValue(6)
                guide.cardsAdded.append(self)
            } else {
                cardNotSupported(guide, scene: scene)
            }
        }
    }
    
    private func cardNotSupported(_ guide: ColumnGuide, scene: ProgrammingScene) {
        let errorMessage = "\(guide.title.uppercased()): The card has wrong format"
        scene.programmingDelegate?.addErrorLog(.cardNotSupported(errorMessage))
        position = data.initialPosition
    }
}
