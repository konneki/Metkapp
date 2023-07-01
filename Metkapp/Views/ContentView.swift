//
//  ContentView.swift
//  Metkapp
//
//  Created by Daniel Konnek on 24.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = Tab.home
    @State var path = NavigationPath()
    
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
            }
            .tag(Tab.home)
            
            NavigationStack {
                WardrobeView()
            }
            .tabItem {
                Image(systemName: "rectangle.portrait.righthalf.filled")
            }
            .tag(Tab.wardrobe)
            
            NavigationStack(path: $path) {
                AddClothesView()
                    .navigationTitle("Dodaj ubranie")
                    .toolbar {
                        ToolbarItem {
                            Button("Add") { }.tint(.accent)
                        }
                    }
                    .tint(LinearGradient.accentGradient)
            }
                .tabItem {
                    Image(systemName: "plus.rectangle.portrait")
                }
                .tag(Tab.add)
            
            NavigationStack {
                InformationView()
                    .navigationTitle("Znaczenie symboli")
            }
                .tabItem {
                    Image(systemName: "info.circle")
                }
                .tag(Tab.information)
        }
        
//        .navigationTitle(selection.title)
//        .toolbar {
//            if selection == Tab.add {
//
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
