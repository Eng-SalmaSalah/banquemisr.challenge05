//
//  FetchMovieDetailsUseCase.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

protocol FetchMovieDetailsUseCase {
    func fetchMovieDetailsWith(movieId: Int,
                               completion: @escaping (Result<Movie, any Error>) -> Void)
}
