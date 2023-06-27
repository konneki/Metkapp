//
//  Colors.swift
//  Metkapp
//
//  Created by Daniel Konnek on 27.06.2023.
//

import SwiftUI

extension Color {
    static var accent = Color(red: 245/255, green: 163/255, blue: 163/255)
    static var accentLight = Color(red: 248/255, green: 183/255, blue: 183/255)
    static var accentShadow = Color(red: 245/255, green: 163/255, blue: 163/255, opacity: 0.5)
    static var shadow = Color(red: 44/255, green: 29/255, blue: 29/255, opacity: 0.1)
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

