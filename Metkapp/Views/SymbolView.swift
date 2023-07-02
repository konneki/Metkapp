//
//  SymbolView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 1.07.2023.
//

import SwiftUI

struct SymbolView: View {
    
    let symbol: Symbols
    
    var body: some View {
        List {
//            ForEach(symbol.symbols, id:\.self) { icon in
//                HStack {
//                    Text("\(symbol.rawValue)")
//                    Spacer()
//                    Image(icon)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30, height: 30)
//                }
//            }
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: Symbols.solvent)
    }
}
