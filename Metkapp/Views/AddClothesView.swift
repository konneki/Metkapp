//
//  AddClothesView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import PhotosUI
import SwiftUI

struct AddClothesView: View {
    
    @StateObject var addClothesVM = AddClothesViewModel()
    @StateObject var symbolsVM = SymbolsViewModel()
    @State private var typeSelection: TypeDetail?
    @State private var clothesName = ""
    @State private var selectedMaterial: ClothesMaterials?
    @State private var selectedColor: ClothesColors?
    
    let symbolDetail = Bundle.main.decode([SymbolDetail].self, from: "symbols.json")
    let typeDetail = Bundle.main.decode([TypeDetail].self, from: "types.json")
    
    var body: some View {
        VStack {
            if let data = addClothesVM.data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .lightShadow, radius: 10)
            } else {
                PhotosPicker(selection: $addClothesVM.selectedPhoto, maxSelectionCount: 1, matching: .images) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .shadow(color: Color.lightShadow, radius: 10)
                        .overlay(
                            Image(systemName: "plus.circle")
                                .foregroundColor(.lightGray)
                                .font(.system(size: 80))
                        )
                }
                .onChange(of: addClothesVM.selectedPhoto) { newValue in
                    addClothesVM.loadImage(from: newValue)
                }
            }
            
            List {
                Section("Nazwa") {
                    TextField("Koszulka Beatles", text: $clothesName)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.lightShadow, radius: 20)
                        .listRowSeparator(.hidden)
                }
                
                Section("Materiał") {
                    Picker("Wybierz rodzaj materiału", selection: $selectedMaterial) {
                        Text("Nie wybrano").tag(nil as ClothesMaterials?)
                        ForEach(ClothesMaterials.allCases, id: \.self) { material in
                            Text(material.rawValue.capitalized).tag(material as ClothesMaterials?)
                        }
                    }
                }
                
                Section("Kolor") {
                    Picker("Wybierz kolor przewodni", selection: $selectedColor) {
                        Text("Nie wybrano").tag(nil as ClothesColors?)
                        ForEach(ClothesColors.allCases, id: \.self) { color in
                            Text(color.rawValue.capitalized).tag(color as ClothesColors?)
                        }
                    }
                }
                
                Section("Symbole") {
                    ForEach(SymbolTypes.allCases, id: \.rawValue) { type in
                        NavigationLink(value: symbolDetail.filter({ $0.type == type })) {
                            HStack {
                                Text(type.rawValue.capitalized)
                                if let icons = symbolsVM.showIcons(for: type) {
                                        Spacer()
                                        ForEach(icons, id: \.self) { icon in
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
                
                Section("Rodzaj ubrań") {
                    ForEach(Types.allCases, id: \.rawValue) { type in
                        NavigationLink(value: typeDetail.filter({ $0.type == type })) {
                            HStack {
                                Text(type.rawValue.capitalized)
                                if let typeSelection = typeSelection {
                                    if type == typeSelection.type {
                                        Spacer()
                                        Text(typeSelection.name)
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
            .listStyle(.plain)
            .headerProminence(.increased)
            .background(.white)
            .navigationDestination(for: [SymbolDetail].self) { symbols in
                SymbolView(symbols: symbols)
                    .environmentObject(symbolsVM)
            }
            .navigationDestination(for: [TypeDetail].self) { types in
                ClothingTypeView(types: types, selection: $typeSelection)
            }
        }
    }
}

struct AddClothesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothesView()
    }
}
