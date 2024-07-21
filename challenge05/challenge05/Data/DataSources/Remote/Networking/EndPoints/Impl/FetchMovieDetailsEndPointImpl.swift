//
//  FetchMovieDetailsEndPointImpl.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMovieDetailsEndPointImpl: FetchMovieDetailsEndPoint {
    private var movieId: Int?

    func setEndPointValues(movieId: Int) {
        self.movieId = movieId
    }
    
    var serviceURL: String {
        guard let movieId = self.movieId else { return "" }
        return "movie/\(movieId)?api_key=\(TMDBConstants.apiKey)&language=en-US"
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
}
