//
//  Tab.swift
//  Metkapp
//
//  Created by Daniel Konnek on 27.06.2023.
//

import Foundation

enum Tab: Int {
    case home = 1
    case wardrobe = 2
    case add = 3
    case information = 4
    var title: String {
        switch self {
            case .home:
            return "Home"
            case .wardrobe:
            return "Your wardrobe"
            case .add:
            return "Add clothes"
            case .information:
            return "Information"
        }
    }
}
