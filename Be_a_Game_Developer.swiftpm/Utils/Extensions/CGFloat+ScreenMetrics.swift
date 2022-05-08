//
//  CGFloat+ScreenMetrics.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import SwiftUI

extension CGFloat {
    static func widthValue(_ value: CGFloat) -> CGFloat {
        let widthValue: CGFloat = UIScreen.main.bounds.size.width
        return widthValue * (value / 1194.0)
    }
    
    static func heightValue(_ value: CGFloat) -> CGFloat {
        let heightValue: CGFloat = UIScreen.main.bounds.size.height
        return heightValue * (value / 834.0)
    }
}
