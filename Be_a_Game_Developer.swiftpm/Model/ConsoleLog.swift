//
//  ConsoleLog.swift
//  WWDC22
//
//  Created by Vitor Gledison Oliveira de Souza on 11/04/22.
//

import Foundation

struct ConsoleLog: Identifiable, Hashable {
    let id = UUID()
    let message: String
    let color: ColorName
}
