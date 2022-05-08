//
//  ProgrammingView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI
import SpriteKit

struct ProgrammingView: View {
    @StateObject var viewModel = ProgrammingViewModel()
    
    var body: some View {
        ZStack {
            Color(ColorName.background.name)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay {
                        VStack(spacing: 0) {
                            SpriteView(scene: viewModel.scene)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                Spacer()
                                
                                Button {
                                    viewModel.resetColumns()
                                } label: {
                                    Text("Reset")
                                        .font(.system(size: .heightValue(25), weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity,
                                               minHeight: 0, maxHeight: .infinity)
                                }
                                .frame(width: .widthValue(315), height: .heightValue(60))
                                .background(Color(ColorName.smoothRed.name))
                                .cornerRadius(15.0)
                                .padding(.trailing, .widthValue(20))
                                
                                Spacer()
                                
                                Button {
                                    viewModel.validateCode()
                                } label: {
                                    Text("Run Code")
                                        .font(.system(size: .heightValue(25), weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity,
                                               minHeight: 0, maxHeight: .infinity)
                                }
                                .frame(width: .widthValue(315), height: .heightValue(60))
                                .background(Color(ColorName.smoothBlue.name))
                                .cornerRadius(15.0)
                                .padding(.trailing, .widthValue(20))
                                
                                Button {
                                    viewModel.showPreview = true
                                } label: {
                                    Text("Preview")
                                        .font(.system(size: .heightValue(25), weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity,
                                               minHeight: 0, maxHeight: .infinity)
                                }
                                .frame(width: .widthValue(200), height: .heightValue(60))
                                .background(Color(ColorName.darkBlue.name))
                                .cornerRadius(15.0)
                            }
                            .padding(.horizontal, .widthValue(15))
                            .padding(.bottom, .heightValue(15))
                            .padding(.top, .heightValue(10))
                        }
                    }
                    .padding(.horizontal, .widthValue(30))
                    .padding(.top, .heightValue(30))
                
                Spacer()
                
                Console(viewModel: viewModel)
            }
            
            if viewModel.showPreview {
                PreviewView(showCurrentScreen: $viewModel.showPreview)
            }
            
            if viewModel.showCongratsView {
                CongratsView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .ignoresSafeArea()
    }
}
