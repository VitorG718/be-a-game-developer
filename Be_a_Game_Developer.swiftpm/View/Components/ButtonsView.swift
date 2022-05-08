//
//  ButtonsView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import SwiftUI

struct ButtonsView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.moveCarToLeft()
            } label: {
                Image(ImageName.leftButton.name)
                    .resizable()
                    .frame(width: .heightValue(150), height: .heightValue(150))
            }
            
            Spacer()
            
            Button {
                viewModel.moveCarToRight()
            } label: {
                Image(ImageName.rightButton.name)
                    .resizable()
                    .frame(width: .heightValue(150), height: .heightValue(150))
            }
        }
    }
}
