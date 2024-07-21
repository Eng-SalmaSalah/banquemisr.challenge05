//
//  MockedMovieDetailsResponseProvider.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

final class MockedMovieDetailsResponseProvider {
    static func getMockedMovieDetailsResponse() -> Movie? {
        guard let url = Bundle(for: MockedMoviesResponseProvider.self).url(forResource: "MockedMovieDetailsResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let movieDetailsResponse = try decoder.decode(Movie.self, from: data)
            return movieDetailsResponse
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
