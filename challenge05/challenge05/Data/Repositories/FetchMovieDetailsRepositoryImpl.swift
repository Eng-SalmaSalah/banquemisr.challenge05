//
//  FetchMovieDetailsRepositoryImpl.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMovieDetailsRepositoryImpl: FetchMovieDetailsRepository {
    private var fetchMovieDetailsEndPoint: FetchMovieDetailsEndPoint
    
    init(fetchMovieDetailsEndPoint: FetchMovieDetailsEndPoint) {
        self.fetchMovieDetailsEndPoint = fetchMovieDetailsEndPoint
    }
    
    func fetchMovieDetailsWith(movieId: Int, completion: @escaping ((Result<Movie, any Error>) -> Void)) {
        fetchMovieDetailsEndPoint.setEndPointValues(movieId: movieId)
        fetchMovieDetailsEndPoint.request { result in
            switch result {
            case .success(let data):
                do {
                    let movieDetailsResponse = try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(movieDetailsResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
