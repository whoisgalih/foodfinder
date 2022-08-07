//
//  Restaurants.swift
//  FoodFinder
//
//  Created by Galih Akbar on 31/07/22.
//

import Foundation

// MARK: - RestaurantsResponse
struct RestaurantsResponse: Codable {
    let error: Bool
    let message: String
    let count: Int
    let restaurants: [Restaurant]
}

// MARK: RestaurantsResponse convenience initializers and mutators

extension RestaurantsResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RestaurantsResponse.self, from: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    init(fromSearchURL url: String, search: String) throws {
        var urlComponents: URLComponents = URLComponents(string: url)!
        let searchQuery: [URLQueryItem] = [URLQueryItem(name: "q", value: search)]
        urlComponents.queryItems = searchQuery
        
        try self.init(fromURL: urlComponents.url!)
    }
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let id, name, restaurantDescription, pictureID: String
    let city: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case id, name
        case restaurantDescription = "description"
        case pictureID = "pictureId"
        case city, rating
    }
}

// MARK: Restaurant convenience initializers and mutators

extension Restaurant: Identifiable {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Restaurant.self, from: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
}

let restaurants = try! RestaurantsResponse(fromURL: URL(string: "\(baseUrl)/list")!)
