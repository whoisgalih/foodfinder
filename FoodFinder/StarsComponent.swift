//
//  StarsComponent.swift
//  FoodFinder
//
//  Created by Galih Akbar on 01/08/22.
//

import SwiftUI

struct StarsComponent: View {
    let rating: Double
    let stars: Int
    let maxRating: Int
    let activeColor: Color
    let inactiveColor: Color
    let fontColor: Color
    
    var body: some View {
        HStack {
            HStack(spacing: 2) {
                ForEach(
                    1...maxRating,
                    id: \.self
                ) { number in
                    number <= stars ?
                    Image(systemName: "star.fill")
                        .foregroundColor(activeColor)
                        .font(.system(size: 10)):
                    Image(systemName: "star")
                        .foregroundColor(inactiveColor)
                        .font(.system(size: 10))
                }
            }
            
            Text("\(rating, specifier: "%.1f")")
                .foregroundColor(fontColor)
                .font(.custom("Inter-Medium", size: 14))
        }
    }
    
    init(rating: Double, maxRating: Int, activeColor: Color = .appYellow, inactiveColor: Color = .appDarkGray, fontColor: Color = .appDarkGray) {
        self.rating = rating
        self.stars = Int(round(rating))
        self.maxRating = maxRating
        self.inactiveColor = inactiveColor
        self.activeColor = activeColor
        self.fontColor = fontColor
    }
}

struct StarsComponent_Previews: PreviewProvider {
    static var previews: some View {
        StarsComponent(rating: 1.4, maxRating: 5)
    }
}


