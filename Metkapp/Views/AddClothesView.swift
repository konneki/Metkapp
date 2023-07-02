//
//  AddClothesView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import PhotosUI
import SwiftUI

struct AddClothesView: View {
    @State private var selectedPhoto: [PhotosPickerItem] = []
    @State private var data: Data?
    
    @State private var clothesName = ""
    
//    let symbolType = Bundle.main.decode(SymbolType.self, from: "symbols.json")
    
    var body: some View {
        VStack {
            if let data = data, let uiimage = UIImage(data: data) {
                Image(uiImage: uiimage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .lightShadow, radius: 10)
            } else {
                PhotosPicker(selection: $selectedPhoto, maxSelectionCount: 1, matching: .images) {
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
                .onChange(of: selectedPhoto) { newValue in
                    guard let image = selectedPhoto.first else { return }
                    
                    image.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data failed to load")
                            }
                        case .failure(let error):
                            fatalError("\(error)")
                        }
                    }
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
                
                Section("Symbole") {
//                    ForEach(Symbols.allCases, id: \.rawValue) { symbol in
//                            NavigationLink(symbol.rawValue, value: symbol)
//                        }
                    
                }
                
                Section("Materiał") {
                    TextField("coś", text: $clothesName)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.lightShadow, radius: 20)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .headerProminence(.increased)
            .background(.white)
            .navigationDestination(for: Symbols.self) { symbol in
                SymbolView(symbol: symbol)
            }
        }
    }
}

struct AddClothesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothesView()
    }
}
