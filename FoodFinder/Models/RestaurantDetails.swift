//
//  RestaurantDetails.swift
//  FoodFinder
//
//  Created by Galih Akbar on 31/07/22.
//

import Foundation

// MARK: - RestaurantResponse
struct RestaurantResponse: Codable {
    let error: Bool
    let message: String
    let restaurant: RestaurantDetail
}

// MARK: RestaurantResponse convenience initializers and mutators

extension RestaurantResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RestaurantResponse.self, from: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
}

// MARK: - RestaurantDetail
struct RestaurantDetail: Codable {
    let id, name, restaurantDescription, city: String
    let address, pictureID: String
    let rating: Double
    let categories: [Category]
    let menus: Menus
    let customerReviews: [CustomerReview]

    enum CodingKeys: String, CodingKey {
        case id, name
        case restaurantDescription = "description"
        case city, address
        case pictureID = "pictureId"
        case rating, categories, menus, customerReviews
    }
}

// MARK: Restaurant convenience initializers and mutators

extension RestaurantDetail {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RestaurantDetail.self, from: data)
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String
}

// MARK: Category convenience initializers and mutators

extension Category {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Category.self, from: data)
    }
}

// MARK: - CustomerReview
struct CustomerReview: Codable {
    let name, review, date: String
}

// MARK: CustomerReview convenience initializers and mutators

extension CustomerReview {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CustomerReview.self, from: data)
    }
}

// MARK: - Menus
struct Menus: Codable {
    let foods, drinks: [Category]
}

// MARK: Menus convenience initializers and mutators

extension Menus {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Menus.self, from: data)
    }
}


//let restaurantResponse = try! RestaurantResponse(fromURL: URL(string: getDetailLink(restaurantId: "rqdv5juczeskfw1e867"))!)
//debugPrint(restaurantResponse)
