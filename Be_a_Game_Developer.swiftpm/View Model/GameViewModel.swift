//
//  GameViewModel.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 07/04/22.
//

import Foundation

final class GameViewModel: ObservableObject, GameSceneDelegate {
    
    @Published var showStartGameView: Bool = true
    @Published var showGameOverView: Bool = false
    @Published var timerString: String = "00:00"
    private var timerValue: Int = 0
    private var timer = Timer()
    private(set) var timeAlive: String = "00:00"
    var delegate: GameViewModelDelegate?
    
    private func timeToString(_ time: Int) -> String {
        guard time <= 6_039 else { return "99:99" }
        
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func startGame() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.timerValue += 1
            self.timerString = self.timeToString(self.timerValue)
            print("timer: \(self.timerValue)")
        }
        delegate?.startGame()
    }
    
    func endGame() {
        timeAlive = timerString
        timer.invalidate()
        showGameOverView = true
    }
    
    func restartGame() {
        timerValue = 0
        timerString = timeToString(0)
        timeAlive = "00:00"
        showGameOverView = false
        delegate?.resetGame()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.showStartGameView = true
        }
    }
    
    func moveCarToLeft() {
        delegate?.moveCarToLeft()
    }
    
    func moveCarToRight() {
        delegate?.moveCarToRight()
    }
}
