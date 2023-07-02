//
//  InformationView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct InformationView: View {
    
    let symbols = Bundle.main.decode([SymbolDetail].self, from: "symbols.json")
    
    var body: some View {
        List {
            ForEach(Symbols.allCases, id: \.rawValue) { type in
                Section(type.rawValue) {
                    ForEach(symbols.filter({ $0.type == type })) { symbol in
                        HStack {
                            Text(symbol.description)
                            Spacer()
                            ForEach(symbol.icons, id: \.self) { icon in
                                Image(icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
