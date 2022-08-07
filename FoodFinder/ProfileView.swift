//
//  ProfileView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 04/08/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .bottom) {
                    Image("myPhoto")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .leading)
                        .clipped()
                    
                    VStack {}
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .leading)
                        .background(.ultraThinMaterial)
                    
                    Image("myPhoto")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 200, maxHeight: 200, alignment: .leading)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.appWhite, lineWidth: 5))
                        .padding(.bottom, -100)
                }
                
                VStack(spacing: 16) {
                    Text("Galih Akbar Nugraha")
                        .font(.custom("Inter-Bold", size: 32))
                        .multilineTextAlignment(.center)
                    
                    Text("galihakbar.ga91@gmail.com")
                        .font(.custom("Inter-regular", size: 16))
                        .multilineTextAlignment(.center)
                        .accentColor(.appDarkGray)
                    
                    Text("🎓 Undergraduate Computer Science 👨‍💻")
                        .font(.custom("Inter-regular", size: 16))
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.top, 100)
                .padding([.bottom, .horizontal], 22)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
