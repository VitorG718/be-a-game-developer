//
//  ProgrammingScene.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SpriteKit
import SwiftUI

class ProgrammingScene: SKScene {
    
    var yellowColumnGuide: ColumnGuide!
    var purpleColumnGuide: ColumnGuide!
    var redColumnGuide: ColumnGuide!
    
    private var activitiesCards = [ProgrammingCard]()
    private var codeSnippetsCards = [ProgrammingCard]()
    weak var programmingDelegate: ProgrammingViewModelDelegate?
    
    override func sceneDidLoad() {
        backgroundColor = .white
        
        let containerSize = CGSize(width: .widthValue(540), height: .heightValue(488))
        let container = SKSpriteNode(color: UIColor(Color(ColorName.lightGray.name)), size: containerSize)
        container.anchorPoint = AnchorPosition.topTrailing.position
        container.position = CGPoint(x: frame.maxX - CGFloat.widthValue(10),
                                     y: frame.maxY - CGFloat.heightValue(10))
        addChild(container)
        
        createActivityTitle(text: "Code Snippets", posX: container.frame.midX)
        createActivityTitle(text: "Activities", posX: frame.width * 0.25)
        
        yellowColumnGuide = createActivityColumn(text: "Indicators",
                                                 position: CGPoint(x: .widthValue(24), y: 0),
                                                 imageName: .yellowColumnGuide,
                                                 nodeName: .yellowColumn)
        purpleColumnGuide = createActivityColumn(text: "Buttons",
                                                 position: CGPoint(x: .widthValue(204), y: 0),
                                                 imageName: .purpleColumnGuide,
                                                 nodeName: .purpleColumn)
        redColumnGuide = createActivityColumn(text: "Car",
                                              position: CGPoint(x: .widthValue(384), y: 0),
                                              imageName: .redColumnGuide,
                                              nodeName: .redColumn)
        
        createProgrammingCards(codeSnippetsContainer: container)
    }
    
    private func createActivityColumn(text: String, position: CGPoint, imageName: ImageName, nodeName: NodeName) -> ColumnGuide {
        let columnsSize = CGSize(width: .widthValue(180), height: .heightValue(410))
        let column = SKSpriteNode(color: .clear, size: columnsSize)
        column.anchorPoint = AnchorPosition.bottomLeading.position
        column.position = position
        column.name = nodeName.name
        column.zPosition = 1000
        addChild(column)

        let attributedString = NSAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: .heightValue(20), weight: .bold)
        ])
        let title = SKLabelNode(attributedText: attributedString)
        let titlePosY = column.frame.height - title.frame.height
        title.position = CGPoint(x: column.frame.midX,
                                 y: titlePosY)
        addChild(title)
        
        let columnGuideSize = CGSize(width: .widthValue(116), height: .heightValue(15))
        let columnGuide = SKSpriteNode(texture: SKTexture(imageNamed: imageName.name), size: columnGuideSize)
        columnGuide.anchorPoint = AnchorPosition.centerTop.position
        columnGuide.position = CGPoint(x: column.frame.midX,
                                       y: title.frame.minY - CGFloat.heightValue(12))
        addChild(columnGuide)
        
        let initialPosition = CGPoint(x: columnGuide.position.x,
                                   y: columnGuide.frame.maxY - CGFloat.heightValue(5))
        return ColumnGuide(columnNode: column,
                           initialPosition: initialPosition,
                           lastPosition: initialPosition,
                           columnName: nodeName,
                           title: text)
    }
    
    private func createActivityTitle(text: String, posX: CGFloat) {
        let attributedString = NSAttributedString(string: text, attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: .heightValue(35), weight: .bold)
        ])
        let title = SKLabelNode(attributedText: attributedString)
        let titlePosY = frame.maxY - title.frame.height - CGFloat.heightValue(30)
        title.position = CGPoint(x: posX, y: titlePosY)
        addChild(title)
    }
    
    private func createProgrammingCard(data: ProgrammingCardData) {
        let card = ProgrammingCard(data: data)
        addChild(card)
    }
    
    private func createProgrammingCards(codeSnippetsContainer: SKSpriteNode) {
        let cardsData = [
            ProgrammingCardData(content: ProgrammingCardContent(text: "Player Car", order: 7),
                                type: .object, imageName: .redSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.minX + CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(100))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "color: white", order: 5),
                                type: .color, imageName: .blueSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.midX,
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(100))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "position:\nright-center", order: 3),
                                type: .position, imageName: .greenSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.maxX - CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(100))),
            
            ProgrammingCardData(content: ProgrammingCardContent(text: "position:\ncenter-bottom", order: 9),
                                type: .position, imageName: .greenSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.minX + CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(225))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "Left Button", order: 4),
                                type: .object, imageName: .purpleSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.midX,
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(225))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "color: blue", order: 2),
                                type: .color, imageName: .blueSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.maxX - CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(225))),
            
            ProgrammingCardData(content: ProgrammingCardContent(text: "Shield Bar", order: 1),
                                type: .object, imageName: .yellowSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.minX + CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(350))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "color: gray", order: 8),
                                type: .color, imageName: .blueSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.midX,
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(350))),
            ProgrammingCardData(content: ProgrammingCardContent(text: "position:\nleft-bottom", order: 6),
                                type: .position, imageName: .greenSnippet,
                                initialPosition: CGPoint(x: codeSnippetsContainer.frame.maxX - CGFloat.widthValue(108),
                                                         y: codeSnippetsContainer.frame.maxY - CGFloat.heightValue(350))),
        ]
        
        for cardData in cardsData {
            createProgrammingCard(data: cardData)
        }
    }
}

