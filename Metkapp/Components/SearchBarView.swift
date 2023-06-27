//
//  SearchBarView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var text = ""
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .shadow, radius: 20)
            
            Button { } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .background(LinearGradient.accentGradient)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .accentShadow, radius: 10)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
