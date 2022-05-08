//
//  Delegates.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 07/04/22.
//

import Foundation

protocol GameViewModelDelegate: AnyObject {
    func moveCarToLeft()
    func moveCarToRight()
    func startGame()
    func resetGame()
}

protocol GameSceneDelegate: AnyObject {
    func endGame()
}

protocol ProgrammingViewModelDelegate: AnyObject {
    func addErrorLog(_ error: ProgrammingCardData.Error)
}
