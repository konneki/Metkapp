//
//  AddClothesViewModel.swift
//  Metkapp
//
//  Created by Daniel Konnek on 8.07.2023.
//

import SwiftUI
import PhotosUI

final class AddClothesViewModel: ObservableObject {
    
    @Published var selectedPhoto: [PhotosPickerItem] = []
    @Published var data: Data?
    
    func loadImage(from photo: [PhotosPickerItem]) {
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
