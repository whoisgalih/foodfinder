//
//  SearchView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 06/08/22.
//

import SwiftUI

struct SearchView: View {
    @Published var restaurants: [Restaurant]
    
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List (restaurants) { restaurant in
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
        .onChange(of: searchText) { _ in
//            runSearch()
        }
    }
    
    mutating func runSearch() {
        if searchText.isEmpty {
            restaurants = try! RestaurantsResponse(fromURL: URL(string: "\(baseUrl)/list")!).restaurants
        } else {
            restaurants = try! RestaurantsResponse(fromSearchURL:"\(baseUrl)/list", search: searchText).restaurants
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
