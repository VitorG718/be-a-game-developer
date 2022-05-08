//
//  GameOverView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI

struct GameOverView: View {
    
    @ObservedObject var viewModel: GameViewModel
    @State private var opacity: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Color
                .black
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        self.opacity = 0.6
                    }
                }
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(ColorName.darkPurple.name))
                .frame(width: .widthValue(520), height: .heightValue(400))
                .overlay {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20.0)
                            .stroke(Color(ColorName.smoothPurple.name), lineWidth: 7.0)
                        
                        VStack {
                            Text("Time Alive")
                                .font(.system(size: .heightValue(50), weight: .bold, design: .default))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.white)
                            
                            Text(viewModel.timeAlive)
                                .font(.system(size: .heightValue(135), weight: .bold, design: .default))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.white)
                                .padding(.bottom, .heightValue(10))
                            
                            Button {
                                viewModel.restartGame()
                            } label: {
                                Text("Play Again")
                                    .font(.system(size: .heightValue(40), weight: .bold, design: .default))
                                    .foregroundColor(.white)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                            }
                            .frame(width: .widthValue(430), height: .heightValue(80))
                            .background(Color(ColorName.smoothPurple.name))
                            .cornerRadius(15.0)
                        }
                        .padding(.horizontal, .widthValue(45))
                        .padding(.vertical, .heightValue(30))
                    }
                }
        }
        .ignoresSafeArea()
    }
}
