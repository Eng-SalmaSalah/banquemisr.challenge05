//
//  DefaultFetchMoviesUseCase.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class DefaultFetchMoviesUseCase: FetchMoviesUseCase {
    private let repo: FetchMoviesRepository
    
    init(repo: FetchMoviesRepository) {
        self.repo = repo
    }
    
    func fetchMoviesWithCategory(category: MoviesCategory, 
                                 pageNumber: Int,
                                 completion: @escaping (Result<MoviesResponseModel, any Error>) -> Void) {
        repo.fetchMoviesWith(category: category,
                             pageNumber: pageNumber,
                             completion: completion)
    }
}
