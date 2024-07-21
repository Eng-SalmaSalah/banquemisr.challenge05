//
//  MockedFetchMovieDetailsRepository.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

class MockedFetchMovieDetailsRepository: FetchMovieDetailsRepository {
    func fetchMovieDetailsWith(movieId: Int, completion: @escaping ((Result<Movie, any Error>) -> Void)) {
        if let mockedMovieDetailsResponse = MockedMovieDetailsResponseProvider.getMockedMovieDetailsResponse() {
            completion(.success(mockedMovieDetailsResponse))
        }else {
            let error = TestingError.mockFailure("Failed to get mock")
            completion (.failure(error))
        }
    }
}
