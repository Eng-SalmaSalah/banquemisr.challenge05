//
//  MockedFetchMoviesRepository.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

class MockedFetchMoviesRepository: FetchMoviesRepository {
    func fetchMoviesWith(category: MoviesCategory,
                         pageNumber: Int,
                         completion: @escaping ((Result<MoviesResponseModel, any Error>) -> Void)) {
        if let mockedMoviesResponse = MockedMoviesResponseProvider.getMockedMoviesResponse() {
            completion(.success(mockedMoviesResponse))
        }else {
            let error = TestingError.mockFailure("Failed to get mock")
            completion (.failure(error))
        }
    }
}
