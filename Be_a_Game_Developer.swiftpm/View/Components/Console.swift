//
//  Console.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import SwiftUI

struct Console: View {
    @ObservedObject var viewModel: ProgrammingViewModel
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color(ColorName.darkGray.name))
            .frame(height: .heightValue(170))
            .overlay {
                VStack(spacing: 0) {
                    Text("Console")
                        .font(.system(size: .heightValue(25), weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 2.0)
                        .fill(Color.white)
                        .frame(height: 2.0)
                    
                    ScrollViewReader { scroll in
                        ScrollView {
                            VStack(spacing: .heightValue(5)) {
                                ForEach(viewModel.data) { log in
                                    Text("\(log.message)")
                                        .font(.system(size: .heightValue(20), weight: .medium, design: .default))
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(log.color.name))
                                        .id(log.id)
                                }
                            }
                            .padding(.vertical, .heightValue(10))
                        }
                        .onChange(of: viewModel.data) { newValue in
                            if let last = newValue.last {
                                scroll.scrollTo(last.id)
                            }
                        }
                    }
                }
                .padding(.horizontal, .widthValue(20))
                .padding(.vertical, .heightValue(10))
            }
            .padding(.bottom, .heightValue(30))
            .padding(.horizontal, .widthValue(30))
    }
}
