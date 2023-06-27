//
//  ContentView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Tab.home
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                    .tag(Tab.home)
                
                WardrobeView()
                    .tabItem {
                        Image(systemName: "rectangle.portrait.righthalf.filled")
                    }
                    .tag(Tab.wardrobe)
                
                AddClothesView()
                    .tabItem {
                        Image(systemName: "plus.rectangle.portrait")
                    }
                    .tag(Tab.add)
                
                InformationView()
                    .tabItem {
                        Image(systemName: "info.circle")
                    }
                    .tag(Tab.information)
            }
            .tint(LinearGradient.accentGradient)
            .navigationTitle(selection.title)
            .toolbar {
                if selection == Tab.add {
                    ToolbarItem {
                        Button("Add") { }.tint(.accent)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
