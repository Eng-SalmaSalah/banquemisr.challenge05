//
//  FetchMoviesEndPoint.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMoviesEndPoint: Endpoint {
    private let category: MoviesCategory
    private let pageNumber: Int

    init(category: MoviesCategory, pageNumber: Int) {
        self.category = category
        self.pageNumber = pageNumber
    }
    
    var serviceURL: String {
        return "movie/\(category.rawValue)?api_key=\(TMDBConstants.apiKey)&language=en-US&page=\(pageNumber)"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
