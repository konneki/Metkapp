//
//  Colors.swift
//  Metkapp
//
//  Created by Daniel Konnek on 27.06.2023.
//

import SwiftUI

extension Color {
    static var accent = Color("AccentColor")
    static var accentLight = Color("AccentLight")
    static var accentShadow = Color("AccentShadow")
    static var lightShadow = Color("LightShadow")
    static var lightGray = Color("LightGray")
}

extension LinearGradient {
    static var accentGradient = LinearGradient(gradient: Gradient(colors: [Color.accent, Color.accentLight]), startPoint: .top, endPoint: .bottom)
}

extension View {
    public func gradientForeground() -> some View {
        self.overlay(LinearGradient.accentGradient)
            .mask(self)
    }
}

