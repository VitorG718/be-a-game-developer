//
//  ColorNames.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 06/04/22.
//

import Foundation

enum ColorName: String {
    case background = "background_color"
    case smoothRed = "smooth_red_color"
    case smoothBlue = "smooth_blue_color"
    case smoothPurple = "smooth_purple_color"
    case darkPurple = "dark_purple_color"
    case darkBlue = "dark_blue_color"
    case darkGray = "dark_gray_color"
    case green = "green_color"
    case red = "red_color"
    case lightGray = "light_gray_color"
    
    var name: String {
        return self.rawValue
    }
}
