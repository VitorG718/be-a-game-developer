//
//  GameRepresentableView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 05/04/22.
//

import SpriteKit
import SwiftUI

class GameViewController: UIViewController {
    
    var scene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myView = SKView()
        myView.ignoresSiblingOrder = false
        myView.isMultipleTouchEnabled = true
        
        view = myView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let scene = scene else { return }
        guard let myView = view as? SKView else { return }
        
        myView.presentScene(scene)
    }
}

struct GameRepresentableView: UIViewControllerRepresentable {
    
    let gameViewModel: GameViewModel
    
    func makeUIViewController(context: Context) -> some GameViewController {
        let screenSize = UIScreen.main.bounds.size
        let scene = GameScene(size: screenSize)
        scene.scaleMode = .aspectFit
        scene.sceneDelegate = gameViewModel
        gameViewModel.delegate = scene
        
        let gameViewController = GameViewController()
        gameViewController.scene = scene
        return gameViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
