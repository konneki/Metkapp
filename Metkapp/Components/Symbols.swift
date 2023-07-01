//
//  Symbol.swift
//  Metkapp
//
//  Created by Daniel Konnek on 29.06.2023.
//

import SwiftUI

enum Symbols: String, CaseIterable {
    case temperature = "Temperatura"
    case iron = "Prasowanie"
    case dry = "Suszenie"
    case wash = "Pranie"
    case solvent = "Chemia"
    case bleach = "Wybielanie"
    var symbols: [String] {
        switch self {
        case .temperature:
            return ["30-80", "40-105", "50-120", "60-140", "70-160", "95-200", "water-temperature-30", "water-temperature-40", "water-temperature-50", "water-temperature-60", "water-temperature-70", "water-temperature-95"]
        case .iron:
            return ["iron-any-temp", "maximum-temp-110-230", "maximum-temp-150-300", "maximum-temp-200-390", "do-not-iron"]
        case .dry:
            return ["tumble-dry", "dry-normal-low-heat", "dry-normal-heat", "dry-high-heat", "dry-normal-no-heat", "dry", "drip-dry", "dry-flat", "hang-to-dry", "dry-in-the-shade", "do-not-dry"]
        case .wash:
            return ["machine-wash", "hand-wash", "machine-wash-permanent-press", "machine-wash-gentle-or-delicate", "do-not-wash"]
        case .solvent:
            return ["any-solvent", "petroleum-solvent-steam", "any-solvent-without-tetrachlorethylene", "clothes-water"]
        case .bleach:
            return ["triangle", "non-chlorine-bleach-if-needed", "do-not-bleach"]
        }
    }
}

struct SymbolDetail {
    let icon: Symbols
    var description: String {
        return "Dupa"
    }
}
