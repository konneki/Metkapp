//
//  InformationView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct InformationView: View {
    
    let symbols = Bundle.main.decode(SymbolType.self, from: "symbols.json")
    
    var body: some View {
        List {
            Section("Temperatura") {
                ForEach(symbols.temperature) { symbol in
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
            Section("Prasowanie") {
                ForEach(symbols.iron) { symbol in
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
            Section("Pranie") {
                ForEach(symbols.wash) { symbol in
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
            Section("Suszenie") {
                ForEach(symbols.dry) { symbol in
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
            Section("Chemia") {
                ForEach(symbols.solvent) { symbol in
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
            Section("Wybielanie") {
                ForEach(symbols.bleach) { symbol in
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

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
