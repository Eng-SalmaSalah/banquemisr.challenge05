//
//  MockedFetchMoviesEndPoint.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

class MockedFetchMoviesEndPoint: FetchMoviesEndPoint {
    var serviceURL: String {
        return ""
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    func setEndPointValues(category: MoviesCategory, pageNumber: Int) {}
    
    func request(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let data = MockedMoviesDataProvider.getMockedMoviesData() else {
            let error = TestingError.mockFailure("Failed to get mock movies data")
            completion (.failure(error))
            return
        }
        completion(.success(data))
    }
}
