//
//  SymbolView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 1.07.2023.
//

import SwiftUI

struct SymbolView: View {
    
    let symbols: [SymbolDetail]
    @Binding var selection: SymbolDetail?
    
    var body: some View {
        List(symbols) { symbol in
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
            .onTapGesture {
                selection = symbol
                print(symbol)
            }
            .navigationTitle(symbol.type.rawValue.capitalized)
        }
    }
}

struct SymbolView_Previews: PreviewProvider {
    
    static var previews: some View {
        SymbolView(symbols: [SymbolDetail(id: 1, description: "test", type: .bleach, icons: ["do-not-bleach"]),SymbolDetail(id: 2, description: "test", type: .bleach, icons: ["do-not-bleach"])], selection: .constant(SymbolDetail(id: 1, description: "test", type: .bleach, icons: ["do-not-bleach"])))
    }
}
