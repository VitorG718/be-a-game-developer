//
//  ImageNames.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 10/04/22.
//

import Foundation

enum ImageName: String {
    case lifeBar = "life_bar_image"
    case roads = "roads_image"
    case leftButton = "left_button_image"
    case rightButton = "right_button_image"
    case shieldBar = "shield_bar_image"
    case playerCar = "player_car_image"
    case enemyCar = "enemy_car_image"
    case congrats = "congrats_image"
    case preview = "preview_image"
    case yellowColumnGuide = "yellow_column_image"
    case redColumnGuide = "red_column_image"
    case purpleColumnGuide = "purple_column_image"
    case yellowSnippet = "yellow_snippet_image"
    case purpleSnippet = "purple_snippet_image"
    case redSnippet = "red_snippet_image"
    case blueSnippet = "blue_snippet_image"
    case greenSnippet = "green_snippet_image"
    
    var name: String {
        self.rawValue
    }
}
