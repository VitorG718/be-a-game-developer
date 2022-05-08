//
//  CongratsView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI

struct CongratsView: View {
    
    @State private var showGameView: Bool = false
    
    var body: some View {
        ZStack {
            Color(ColorName.background.name)
                .ignoresSafeArea()
            
            VStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(Color(ColorName.smoothRed.name))
                    .frame(width: .widthValue(807), height: .heightValue(471))
                    .overlay {
                        HStack {
                            Text("Congratulations you've developed your first game!")
                                .font(.system(size: .heightValue(35), weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .padding(.trailing, .widthValue(50))
                            
                            Image(ImageName.congrats.name)
                                .resizable()
                                .frame(width: .heightValue(250), height: .heightValue(250))
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.horizontal, .widthValue(75))
                    }
                    .padding(.bottom, .heightValue(40))
                
                Button {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        self.showGameView = true
                    }
                } label: {
                    HStack {
                        Text("Play Game")
                            .font(.system(size: .heightValue(40), weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .padding(.trailing, .widthValue(30))
                        
                        Image(systemName: "play")
                            .resizable()
                            .symbolVariant(.fill)
                            .frame(width: .heightValue(65), height: .heightValue(65))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                }
                .frame(width: .widthValue(600), height: .heightValue(126))
                .background(Color(ColorName.smoothBlue.name))
                .cornerRadius(15.0)
            }
            
            if showGameView {
                let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)).combined(with: .opacity)
                
                GameView()
                    .ignoresSafeArea()
                    .transition(transition)
            }
        }
    }
}
