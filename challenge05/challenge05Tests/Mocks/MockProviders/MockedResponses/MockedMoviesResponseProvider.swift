//
//  MockedMoviesResponseProvider.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

final class MockedMoviesResponseProvider {
    static func getMockedMoviesResponse() -> MoviesResponseModel? {
        guard let url = Bundle(for: MockedMoviesResponseProvider.self).url(forResource: "MockedMoviesResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let moviesResponse = try decoder.decode(MoviesResponseModel.self, from: data)
            return moviesResponse
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
