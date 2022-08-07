//
//  Helper.swift
//  FoodFinder
//
//  Created by Galih Akbar on 31/07/22.
//

import Foundation

// MARK: - Helper functions for creating encoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func getImageLink(pictureId: String, path: String = "/images/medium/", baseURL: String = baseUrl) -> String {
    return "\(baseURL)\(path)\(pictureId)"
}

func getDetailLink(restaurantId: String, path: String = "/detail/", baseURL: String = baseUrl) -> String {
    return "\(baseURL)\(path)\(restaurantId)"
}

func getJoinedCategory(categories: [Category]) -> String {
    var stringArr: [String] = []
    
    for category in categories {
        stringArr.append(category.name)
    }
    
    return stringArr.joined(separator: ", ")
}
