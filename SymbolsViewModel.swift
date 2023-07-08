//
//  SymbolsViewModel.swift
//  Metkapp
//
//  Created by Daniel Konnek on 3.07.2023.
//

import Foundation

final class SymbolsViewModel: ObservableObject {
    
    @Published var temperature: SymbolDetail?
    @Published var iron: SymbolDetail?
    @Published var dry: SymbolDetail?
    @Published var wash: SymbolDetail?
    @Published var solvent: SymbolDetail?
    @Published var bleach: SymbolDetail?
    
    func addSymbol(_ symbol: SymbolDetail) {
        switch symbol.type {
        case .temperature:
            temperature = symbol
        case .iron:
            iron = symbol
        case .dry:
            dry = symbol
        case .wash:
            wash = symbol
        case .solvent:
            solvent = symbol
        case .bleach:
            bleach = symbol
        }
        print(symbol.id)
    }
    
    func showIcons(for symbolTypes: SymbolTypes) -> [String]? {
        switch symbolTypes {
        case .temperature:
            if let temperature {
                return temperature.icons
            }
        case .iron:
            if let iron {
                return iron.icons
            }
        case .dry:
            if let dry {
                return dry.icons
            }
        case .wash:
            if let wash {
                return wash.icons
            }
        case .solvent:
            if let solvent {
                return solvent.icons
            }
        case .bleach:
            if let bleach {
                return bleach.icons
            }
        }
        return nil
    }
}
