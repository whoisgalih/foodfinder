//
//  RestaurantDetailView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 01/08/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State private var restaurant: RestaurantDetail
    
    var body: some View {
        List {
            // MARK: - Title
            Section {
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(
                            LinearGradient(colors: [.black.opacity(0.8), .white.opacity(0)], startPoint: .bottom, endPoint: .top)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(restaurant.name)")
                            .font(.custom("Inter-Black", size: 36))
                            .fixedSize(horizontal: false, vertical: true)
                        Label("\(restaurant.address), \(restaurant.city)", systemImage: "mappin.and.ellipse")
                            .font(.custom("Inter-SemiBold", size: 20))
                        StarsComponent(rating: restaurant.rating, maxRating: 5, inactiveColor: .appWhite, fontColor: .appWhite)
                    }
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 22)
                    .padding(.vertical, 16)
                }
                .frame(minHeight: 400, maxHeight: 400)
                .background(
                    AsyncImage(url: URL(
                        string: getImageLink(pictureId: restaurant.pictureID)
                    )){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                )
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
            
            // MARK: - Tags
            Text("Tags: \(getJoinedCategory(categories: restaurant.categories))")
                .font(.custom("Inter-Light", size: 12))
                .foregroundColor(.appDarkGray)
            
            // MARK: - About
            Section(
                header: Text("About")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.appDarkGreen)
            ) {
                Text("\(restaurant.restaurantDescription)")
                    .font(.custom("Inter-Light", size: 16))
            }
            .padding(22)
            .listRowInsets(EdgeInsets())
            
            // MARK: - Menu
            Section(
                header: Text("Menu")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.appDarkGreen)
            ) {
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Food")
                            .font(.custom("Inter-Medium", size: 20))
                            .foregroundColor(.appDarkGreen)
                            .padding(.bottom, 8)
                        ForEach(restaurant.menus.foods, id: \.name) { food in
                            Label("\(food.name)", systemImage: "circlebadge")
                                .foregroundColor(.appBlack)
                                .font(.custom("Inter-Light", size: 16))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(20)
                    .clipped()
                    .shadow(color: .appGray.opacity(0.5), radius: 10, x: 0, y: 5)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Drinks")
                            .font(.custom("Inter-Medium", size: 20))
                            .foregroundColor(.appDarkGreen)
                            .padding(.bottom, 8)
                        ForEach(restaurant.menus.drinks, id: \.name) { drink in
                            Label("\(drink.name)", systemImage: "circlebadge")
                                .foregroundColor(.appBlack)
                                .font(.custom("Inter-Light", size: 16))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .cornerRadius(20)
                    .clipped()
                    .shadow(color: .appGray.opacity(0.5), radius: 10, x: 0, y: 5)
                }
            }
            .padding(22)
            .listRowInsets(EdgeInsets())
            
            // MARK: - Reviews
            Section(
                header: Text("Reviews")
                    .font(.custom("Inter-SemiBold", size: 20))
                    .foregroundColor(.appDarkGreen)
            ) {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(restaurant.customerReviews, id: \.name) { review in
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(review.name)")
                                .font(.custom("Inter-Medium", size: 16))
                            Text("\(review.review)")
                                .font(.custom("Inter-Light", size: 16))
                            Text("\(review.date)")
                                .font(.custom("Inter-SemiBold", size: 8))
                                .padding(.top, 8)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(20)
                        .clipped()
                        .shadow(color: .appGray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                }
            }
            .padding(22)
            .listRowInsets(EdgeInsets())
            
        }
        .listStyle(.plain)
        .navigationTitle(restaurant.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    init(id: String) {
        _restaurant = State(initialValue: try! RestaurantResponse(fromURL: URL(string: "\(baseUrl)/detail/\(id)")!).restaurant)
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(
            id: "w9pga3s2tubkfw1e867"
        )
    }
}
