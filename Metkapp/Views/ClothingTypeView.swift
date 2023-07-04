//
//  ClothingTypesView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 4.07.2023.
//

import SwiftUI

struct ClothingTypeView: View {
    
    let types: [TypeDetail]
    @Binding var selection: TypeDetail?

    var body: some View {
        List(types, selection: $selection) { type in
            Text(type.name)
            .onTapGesture {
                selection = type
//                print(type)
            }
            .navigationTitle(type.type.rawValue.capitalized)
        }
    }
}
