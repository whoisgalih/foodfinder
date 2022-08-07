//
//  RestaurantListView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 01/08/22.
//

import SwiftUI

struct RestaurantListView: View {
    let restaurants: [Restaurant]
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List (restaurantsSearch) { restaurant in
                NavigationLink {
                    RestaurantDetailView(id: restaurant.id)
                } label: {
                    RestaurantRowView(restaurant: restaurant)
                    
                }
                .listRowInsets(EdgeInsets())
                .padding()
                .listRowSeparator(.hidden)
            }
            .searchable(text: $searchText)
            .navigationTitle("Restaurants")
        }
        
    }
    
    
    var restaurantsSearch: [Restaurant] {
        if searchText.isEmpty {
            return restaurants
        } else {
            return restaurants.filter { $0.name.contains(searchText) || $0.city.contains(searchText) }
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(restaurants: try! RestaurantsResponse(fromURL: URL(string: "\(baseUrl)/list")!).restaurants)
    }
}
