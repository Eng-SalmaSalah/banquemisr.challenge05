//
//  FetchMoviesRepositoryImpl.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class FetchMoviesRepositoryImpl: FetchMoviesRepository {
    private var fetchMoviesEndPoint: FetchMoviesEndPoint
    
    init(fetchMoviesEndPoint: FetchMoviesEndPoint) {
        self.fetchMoviesEndPoint = fetchMoviesEndPoint
    }
    
    func fetchMoviesWith(category: MoviesCategory,
                         pageNumber: Int,
                         completion: @escaping ((Result<MoviesResponseModel, any Error>) -> Void)) {
        fetchMoviesEndPoint.setEndPointValues(category: category, pageNumber: pageNumber)
        fetchMoviesEndPoint.request { result in
            switch result {
            case .success(let data):
                do {
                    let moviesResponse = try JSONDecoder().decode(MoviesResponseModel.self, from: data)
                    completion(.success(moviesResponse))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
