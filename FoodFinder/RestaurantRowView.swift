//
//  RestaurantRowView.swift
//  FoodFinder
//
//  Created by Galih Akbar on 01/08/22.
//

import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(
                string: getImageLink(pictureId: restaurant.pictureID, path: "/images/small/")
            )){ image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80, alignment: .center)
            .background(Color.yellow)
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .font(.custom("Inter-Bold", size: 20))
                    .foregroundColor(.appDarkGreen)
                Text(restaurant.city)
                    .font(.custom("Inter-Light", size: 16))
                
                StarsComponent(rating: restaurant.rating, maxRating: 5)
                    .padding(.top, 5)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.vertical, 1)
            
        }
        .frame(maxHeight: 80)
    }
}

struct RestaurantRowView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRowView(restaurant:
                            Restaurant(
                                id: "rqdv5juczeskfw1e867",
                                name: "Melting Pot",
                                restaurantDescription: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
                                pictureID: "14",
                                city: "Medan",
                                rating: 4.2))
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
