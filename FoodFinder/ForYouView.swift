//
//  ForYouView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 02/08/22.
//

import SwiftUI

struct ForYouView: View {
    let restaurants: [Restaurant]
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    Text("Random Picked")
                        .foregroundColor(.appBlack)
                        .font(.custom("Inter-SemiBold", size: 20))
                        .listRowSeparator(.hidden)
                    
                    
                    
                    ForEach(restaurants) { restaurant in
                        
                        ZStack {
                            NavigationLink(destination: RestaurantDetailView(id: restaurant.id)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            VStack(alignment: .leading) {
                                VStack(alignment: .leading) {
                                    Text("\(restaurant.name)")
                                        .font(.custom("Inter-SemiBold", size: 16))
                                    
                                    Spacer()
                                        .frame(maxHeight:4)
                                    
                                    Text("\(restaurant.city)")
                                        .font(.custom("Inter-Light", size: 14))
                                    
                                    Spacer()
                                        .frame(maxHeight:16)
                                    
                                    StarsComponent(rating: restaurant.rating, maxRating: 5)
                                }
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding()
                                .background(.ultraThickMaterial)
                                .cornerRadius(20)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                            .padding()
                        }
                        .frame(maxWidth: .infinity, minHeight: 400, alignment: .center)
                        .background(
                            AsyncImage(url: URL(
                                string: getImageLink(pictureId: restaurant.pictureID)
                            )){ image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Group {
                                    ProgressView()
                                }
                                .frame(maxWidth: .infinity,  maxHeight: .infinity)
                            }
                                .background(Color.appGray)
                        )
                        .cornerRadius(30)
                    }
                    .clipped()
                    .shadow(color: .appDarkGray.opacity(0.3), radius: 10, x: 0, y: 5)
                    .padding(.bottom, 16)
                    .listRowSeparator(.hidden)
                    
                    
                }
                .listStyle(.plain)
                .navigationTitle("Wellcome 🔥")
            }
        }
    }
    
    init(restaurants: [Restaurant]) {
        var allRestaurants: [Restaurant] = restaurants
        var randomRestaurants: [Restaurant] = []
        
        for _ in 1...(allRestaurants.count >= 5 ? 5 : allRestaurants.count) {
            let randomIndex: Int = Int.random(in: 0..<allRestaurants.count)
            randomRestaurants.append(allRestaurants[randomIndex])
            allRestaurants.remove(at: randomIndex)
        }
        
        self.restaurants = randomRestaurants
    }
}

struct ForYouView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouView(restaurants: try! RestaurantsResponse(fromURL: URL(string: "\(baseUrl)/list")!).restaurants)
    }
}
