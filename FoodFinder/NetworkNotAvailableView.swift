//
//  NetworkNotAvailableView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 05/08/22.
//

import SwiftUI

struct NetworkNotAvailableView: View {
    var body: some View {
        VStack(spacing: 16
        ) {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.appDarkGreen)
            
            
            Text("Connection not available")
                .multilineTextAlignment(.center)
                .font(.custom("Inter-Bold", size: 20))
            Text("Please Enable your wifi or cellular data")
                .multilineTextAlignment(.center)
                .font(.custom("Inter-Light", size: 16))
        }
    }
}

struct NetworkNotAvailableView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkNotAvailableView()
    }
}
