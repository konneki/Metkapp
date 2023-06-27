//
//  ButtonMockupView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct ButtonMockupView: View {
    
    let systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .foregroundColor(.white)
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 245/255, green: 163/255, blue: 163/255), Color(red: 248/255, green: 183/255, blue: 183/255)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color(red: 245/255, green: 163/255, blue: 163/255, opacity: 0.5), radius: 15)
    }
}

struct ButtonMockupView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonMockupView(systemImageName: "arrow.up.arrow.down")
    }
}
