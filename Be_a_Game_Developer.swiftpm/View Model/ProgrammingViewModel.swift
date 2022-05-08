//
//  ProgrammingViewModel.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import SwiftUI

final class ProgrammingViewModel: ObservableObject, ProgrammingViewModelDelegate {
    
    @Published var showPreview: Bool = false
    @Published var showCongratsView: Bool = false
    @Published private(set) var data: [ConsoleLog] = []
    private(set) var scene: ProgrammingScene
    private var answerYellowColumn = [1, 2, 3]
    private var answerPurpleColumn = [4, 5, 6]
    private var answerRedColumn = [7, 8, 9]
    
    init() {
        scene = ProgrammingScene(size: CGSize(width: .widthValue(1137), height: .heightValue(498)))
        scene.programmingDelegate = self
    }
    
    private func addLog(_ message: String) {
        data.append(ConsoleLog(message: message, color: .green))
    }
    
    func validateCode() {
        let validatedYellowColumn = validateColumn(guide: scene.yellowColumnGuide,
                                                   answer: answerYellowColumn, showLog: true)
        let validatedPurpleColumn = validateColumn(guide: scene.purpleColumnGuide,
                                                   answer: answerPurpleColumn, showLog: true)
        let validatedRedColumn = validateColumn(guide: scene.redColumnGuide,
                                                answer: answerRedColumn, showLog: true)

        if validatedYellowColumn && validatedPurpleColumn && validatedRedColumn {
            addLog("All elements of your code are according to the prototype")
            withAnimation(.easeIn(duration: 0.8).delay(1.0)) {
                self.showCongratsView = true
            }
        }
    }
    
    func addErrorLog(_ error: ProgrammingCardData.Error) {
        switch error {
        case .cardNotSupported(let message):
            data.append(ConsoleLog(message: message, color: .red))
        case .wrongSequence(let message):
            data.append(ConsoleLog(message: message, color: .red))
        }
    }
    
    private func validateColumn(guide: ColumnGuide, answer: [Int], showLog: Bool = false) -> Bool {
        let column = guide.cardsAdded.map({ $0.data.content.order })
        
        if column == answer {
            if showLog {
                addLog("\(guide.title.uppercased()): Column is correct")
            }
        } else {
            if showLog {
                if column.isEmpty {
                    addErrorLog(.wrongSequence("\(guide.title.uppercased()): Column is empty"))
                } else {
                    addErrorLog(.wrongSequence("\(guide.title.uppercased()): Wrong sequence"))
                }
            }
            return false
        }
        
        return true
    }
    
    func resetColumns() {
        if !validateColumn(guide: scene.yellowColumnGuide, answer: answerYellowColumn) {
            resetColumn(&scene.yellowColumnGuide)
        }
        
        if !validateColumn(guide: scene.purpleColumnGuide, answer: answerPurpleColumn) {
            resetColumn(&scene.purpleColumnGuide)
        }
        
        if !validateColumn(guide: scene.redColumnGuide, answer: answerRedColumn) {
            resetColumn(&scene.redColumnGuide)
        }
    }
    
    private func resetColumn(_ guide: inout ColumnGuide) {
        guide.cardsAdded.forEach { card in
            card.position = card.data.initialPosition
        }
        guide.lastPosition = guide.initialPosition
        guide.cardsAdded.removeAll()
    }
}
