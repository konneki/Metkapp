//
//  ClothesTypes.swift
//  Metkapp
//
//  Created by Daniel Konnek on 3.07.2023.
//

import SwiftUI

enum Types: String, Decodable, CaseIterable {
    case upperClothing = "odzież wierzchnia"
    case bottomClothing = "odzież dolna"
    case underwear = "bielizna"
    case sportswear = "odzież sportowa"
    case other = "inne"
    case wholeBody = "całe ciało"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let type = try? container.decode(String.self)
        switch type {
        case "upperClothing": self = .upperClothing
        case "bottomClothing": self = .bottomClothing
        case "underwear": self = .underwear
        case "sportswear": self = .sportswear
        case "other": self = .other
        case "wholeBody": self = .wholeBody
        default:
            self = .other
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "odzież wierzchnia": self = .upperClothing
        case "odzież dolna": self = .bottomClothing
        case "bielizna": self = .underwear
        case "odzież sportowa": self = .sportswear
        case "inne": self = .other
        case "całe ciało": self = .wholeBody
        default:
            return nil
        }
    }
}

struct TypeDetail: Decodable, Identifiable, Hashable {
    var id: Int
    var name: String
    var type: Types
}
