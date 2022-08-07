//
//  Theme.swift
//  FoodFinder
//
//  Created by Galih Akbar on 31/07/22.
//

import SwiftUI

extension Color {
    static let appBlack = Color("black")
    static let appDarkGray = Color("darkGray")
    static let appGray = Color("gray")
    static let appLightGray = Color("lightGray")
    static let appWhite = Color("white")
    
    static let appDarkGreen = Color("darkGreen")
    static let appGreen = Color("green")
    static let appLightGreen = Color("lightGreen")
    static let appLime = Color("lime")
    static let appYellow = Color("yellow")
}

struct appFont {
    struct weight {
        let black: String
        let bold: String
        let extraBold: String
        let extraLight: String
        let light: String
        let medium: String
        let regular: String
        let semiBold: String
        let thin: String
        
        init(name: String) {
            self.black = "\(name)-Black.ttf"
            self.bold = "\(name)-Bold.ttf"
            self.extraBold = "\(name)-ExtraBold.ttf"
            self.extraLight = "\(name)-ExtraLight.ttf"
            self.light = "\(name)-Light.ttf"
            self.medium = "\(name)-Medium.ttf"
            self.regular = "\(name)-Regular.ttf"
            self.semiBold = "\(name)-SemiBold.ttf"
            self.thin = "\(name)-Thin.ttf"
        }
    }
    
    static let inter: weight = weight(name: "Inter")
}
