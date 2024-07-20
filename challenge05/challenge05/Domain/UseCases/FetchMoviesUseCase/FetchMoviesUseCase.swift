//
//  FetchMoviesUseCase.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

protocol FetchMoviesUseCase {
    func fetchMoviesWithCategory(category: MoviesCategory,
                                 pageNumber: Int,
                                 completion: @escaping (Result<MoviesResponseModel, any Error>) -> Void)
}
