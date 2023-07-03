//
//  Symbol.swift
//  Metkapp
//
//  Created by Daniel Konnek on 29.06.2023.
//

import SwiftUI

enum SymbolTypes: String, Decodable, CaseIterable {
    typealias RawValue = String
    
    case temperature = "temperatura"
    case iron = "prasowanie"
    case dry = "suszenie"
    case wash = "pranie"
    case solvent = "chemia"
    case bleach = "wybielanie"
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let type = try? container.decode(String.self)
        switch type {
        case "temperature": self = .temperature
        case "iron": self = .iron
        case "dry": self = .dry
        case "wash": self = .wash
        case "solvent": self = .solvent
        case "bleach": self = .bleach
        default:
            self = .bleach
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "temperatura": self = .temperature
        case "prasowanie": self = .iron
        case "suszenie": self = .dry
        case "pranie": self = .wash
        case "chemia": self = .solvent
        case "wybielanie": self = .bleach
        default:
            return nil
        }
    }
}

struct SymbolDetail: Decodable, Identifiable, Hashable {
    var id: Int
    var description: String
    var type: SymbolTypes
    var icons: [String]
}

