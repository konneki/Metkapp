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
            
            VStack(alignment: .leading) {
                Section("Nazwa") {
                    TextField("Koszulka Beatles", text: $clothesName)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: Color.lightShadow, radius: 20)
                }
                
                Section("Symbole") {
//                    Text("Temperatura")
//                    Text("Prasowanie")
//                    Text("Pranie")
//                    Text("Suszenie")
//                    Text("Chemia")
//                    Text("Inne")
                }
            }
            
        }
        .padding()
    }
}

struct AddClothesView_Previews: PreviewProvider {
    static var previews: some View {
        AddClothesView()
    }
}
