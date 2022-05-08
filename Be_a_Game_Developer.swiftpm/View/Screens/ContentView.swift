//
//  ContentView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 05/04/22.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State var showProgrammingView: Bool = false
    @State var orientation = UIDevice.current.orientation
    var isLandscape: Bool {
        if orientation.isLandscape {
            return true
        } else if orientation == .unknown {
            let screenSize = UIScreen.main.bounds.size
            if screenSize.width > screenSize.height {
                return true
            }
        }
        return false
    }
    
    var body: some View {
        ZStack {
            Color(ColorName.background.name)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 15.0)
                .fill(Color(ColorName.smoothRed.name))
                .overlay {
                    VStack {
                        Text("About the scene")
                            .font(.system(size: .heightValue(35), weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity,
                                   alignment: .center)
                            .padding(.vertical, .heightValue(55))
                        
                        
                        Group {
                            if isLandscape {
                                Text("""
                                Hi! I'm Vitor and I developed this scene in order to convey a little bit of the experience of programming a game, because I really like programming and games, so I decided to combine a little bit of both worlds in this interactive scene.

                                Here you will use a block programming style to develop your game, the objective is to develop a game that is in accordance with the prototype, which simulates a real environment. The prototype can be viewed on the preview button.

                                So, I hope you enjoy it a lot and have a great experience developing your game!
                                """)
                            } else {
                                Text("Please, use your device in landscape orientation.")
                            }
                        }
                        .font(.system(size: .heightValue(25), weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.horizontal, .widthValue(75))
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            if isLandscape {
                                Button {
                                    withAnimation(.easeInOut(duration: 0.8)) {
                                        self.showProgrammingView = true
                                    }
                                } label: {
                                    Text("Continue")
                                        .font(.system(size: .heightValue(30), weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity,
                                               minHeight: 0, maxHeight: .infinity)
                                }
                                .frame(width: .widthValue(420), height: .heightValue(70))
                                .background(Color(ColorName.smoothBlue.name))
                                .cornerRadius(15.0)
                                .padding(.all, .heightValue(15))
                            }
                        }
                    }
                }
                .padding(.all, .heightValue(60))
            
            if showProgrammingView {
                ProgrammingView()
                    .transition(.move(edge: .trailing))
            }
        }
        .ignoresSafeArea()
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}
