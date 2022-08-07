//
//  ContentView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 31/07/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    @State private var restaurantsResponse = try! RestaurantsResponse(fromURL: URL(string: "\(baseUrl)/list")!)
    
    var body: some View {
        if networkManager.isConnected {
            TabView {
                RestaurantListView(restaurants: restaurantsResponse.restaurants)
                    .tabItem{
                        Label("List", systemImage: "list.bullet.rectangle.portrait")
                    }
                ForYouView(restaurants: restaurantsResponse.restaurants)
                    .tabItem{
                        Label("For You", systemImage: "doc.text.image")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
            }
        } else {
            NetworkNotAvailableView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
