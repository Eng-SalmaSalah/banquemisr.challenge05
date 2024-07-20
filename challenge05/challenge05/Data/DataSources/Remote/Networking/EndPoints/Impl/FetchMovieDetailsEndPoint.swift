//
//  FetchMovieDetailsEndPoint.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMovieDetailsEndPoint: Endpoint {
    private let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var serviceURL: String {
        return "movie/\(movieId)?api_key=\(TMDBConstants.apiKey)&language=en-US"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
