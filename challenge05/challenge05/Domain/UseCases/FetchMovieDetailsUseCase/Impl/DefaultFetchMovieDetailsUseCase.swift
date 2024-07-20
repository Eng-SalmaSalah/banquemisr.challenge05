//
//  DefaultFetchMovieDetailsUseCase.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class DefaultFetchMovieDetailsUseCase: FetchMovieDetailsUseCase {
    private let repo: FetchMovieDetailsRepository
    
    init(repo: FetchMovieDetailsRepository) {
        self.repo = repo
    }
    
    func fetchMovieDetailsWith(movieId: Int, completion: @escaping (Result<Movie, any Error>) -> Void) {
        repo.fetchMovieDetailsWith(movieId: movieId, completion: completion)
    }
}
