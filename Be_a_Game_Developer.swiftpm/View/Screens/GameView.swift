//
//  GameView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI

struct GameView: View {
    
    @StateObject private var viewModel = GameViewModel()
    @State private var opacity: CGFloat = 0.0
    @State private var showTouchToStartLabel: Bool = false
    
    var body: some View {
        ZStack {
            GameRepresentableView(gameViewModel: viewModel)
            
            VStack {
                HStack {
                    Spacer()
                    TimerView(viewModel: viewModel)
                }
                
                Spacer()
                
                ButtonsView(viewModel: viewModel)
            }
            .padding(.horizontal, .widthValue(30))
            .padding(.top, .heightValue(45))
            .padding(.bottom, .heightValue(60))
            
            if viewModel.showGameOverView {
                GameOverView(viewModel: viewModel)
            }
            
            if viewModel.showStartGameView {
                ZStack {
                    Color
                        .black
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.6)) {
                                self.opacity = 0.6
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    self.showTouchToStartLabel = true
                                }
                            }
                        }
                    
                    if showTouchToStartLabel {
                        Text("Touch anywhere to start")
                            .multilineTextAlignment(.center)
                            .font(.system(size: .heightValue(100), weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .transition(.opacity)
                            .padding(.horizontal, .widthValue(150))
                    }
                }
                .transition(.opacity)
                .onTapGesture {
                    withAnimation(.easeOut(duration: 0.5)) {
                        self.opacity = 0.0
                        self.showTouchToStartLabel = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        self.viewModel.showStartGameView = false
                        self.viewModel.startGame()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}
