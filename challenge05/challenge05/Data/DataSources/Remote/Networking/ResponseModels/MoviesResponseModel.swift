//
//  MoviesResponseModel.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

struct MoviesResponseModel: Codable {
    let results: [Movie]
    let page: Int
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
