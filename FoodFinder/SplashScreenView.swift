//
//  SplashScreenView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 05/08/22.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.appDarkGreen.ignoresSafeArea()
            VStack(spacing: 32) {
                Image(systemName: "fork.knife")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                Text("Food Finder")
                    .font(.custom("Inter-Black", size: 32))
            }.foregroundColor(.appWhite)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
