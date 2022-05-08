//
//  PreviewView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI

struct PreviewView: View {
    
    @Binding var showCurrentScreen: Bool
    @State var opacity: CGFloat = 0.0
    
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
            
            VStack(spacing: 0) {
                Image(ImageName.preview.name)
                    .resizable()
                    .frame(width: .widthValue(1060), height: .heightValue(565))
                    .foregroundColor(.white)
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .padding(.horizontal, .widthValue(15))
                    .padding(.vertical, .heightValue(15))
                
                Button {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        self.opacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                        self.showCurrentScreen = false
                    }
                } label: {
                    Text("Return to code")
                        .font(.system(size: .heightValue(35), weight: .bold, design: .default))
                        .foregroundColor(Color(ColorName.smoothBlue.name))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(width: .widthValue(975), height: .heightValue(80))
                .background(Color.white)
                .cornerRadius(20.0)
                .padding(.horizontal, .widthValue(60))
                .padding(.bottom, .heightValue(15))
            }
            .background(Color(ColorName.smoothBlue.name))
            .cornerRadius(20.0)
        }
        .ignoresSafeArea()
    }
}
