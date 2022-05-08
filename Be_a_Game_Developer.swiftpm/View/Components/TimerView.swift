//
//  TimerView.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 07/04/22.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10.0)
            .stroke(Color.white, lineWidth: 5.0)
            .frame(width: .widthValue(150), height: .heightValue(60))
            .overlay {
                Text(viewModel.timerString)
                    .font(.system(size: .heightValue(40), weight: .bold, design: .default))
                    .foregroundColor(.white)
            }
    }
}
