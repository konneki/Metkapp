//
//  Symbol.swift
//  Metkapp
//
//  Created by Daniel Konnek on 29.06.2023.
//

import SwiftUI

enum Symbols: String, Decodable, CaseIterable {
    typealias RawValue = String
    
    case temperature = "Temperatura"
    case iron = "Prasowanie"
    case dry = "Suszenie"
    case wash = "Mycie"
    case solvent = "Chemia"
    case bleach = "Wybielanie"
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
        case "Temperatura": self = .temperature
        case "Prasowanie": self = .iron
        case "Suszenie": self = .dry
        case "Mycie": self = .wash
        case "Chemia": self = .solvent
        case "Wybielanie": self = .bleach
        default:
            return nil
        }
    }
}

struct SymbolDetail: Decodable, Identifiable {
    var id: Int
    var description: String
    var type: Symbols
    var icons: [String]
}

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
