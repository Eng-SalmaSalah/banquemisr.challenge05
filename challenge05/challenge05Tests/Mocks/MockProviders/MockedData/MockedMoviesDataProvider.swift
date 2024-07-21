//
//  MockedMoviesDataProvider.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

final class MockedMoviesDataProvider {
    static func getMockedMoviesData() -> Data? {
        guard let url = Bundle(for: MockedMoviesDataProvider.self).url(forResource: "MockedMoviesResponse", withExtension: "json") else {
            print("Mocked JSON file not found.")
            return nil}
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
            return nil
        }
    }
}
