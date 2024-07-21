//
//  FetchMoviesEndPointImpl.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMoviesEndPointImpl: FetchMoviesEndPoint {
    private var category: MoviesCategory?
    private var pageNumber: Int?

    func setEndPointValues(category: MoviesCategory, pageNumber: Int) {
        self.category = category
        self.pageNumber = pageNumber
    }
    
    var serviceURL: String {
        guard let category = self.category,
              let pageNumber = self.pageNumber else { return "" }
        return "movie/\(category.rawValue)?api_key=\(TMDBConstants.apiKey)&language=en-US&page=\(pageNumber)"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
