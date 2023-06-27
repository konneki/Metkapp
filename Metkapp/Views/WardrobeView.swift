//
//  WardrobeView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct WardrobeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView()
        }
        .padding()
    }
}

struct WardrobeView_Previews: PreviewProvider {
    static var previews: some View {
        WardrobeView()
    }
}
