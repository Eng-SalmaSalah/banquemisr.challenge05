//
//  MockedMovieDetailsDataProvider.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
@testable import challenge05

final class MockedMovieDetailsDataProvider {
    static func getMockedMovieDetailsData() -> Data? {
        guard let url = Bundle(for: MockedMovieDetailsDataProvider.self).url(forResource: "MockedMovieDetailsResponse", withExtension: "json") else {
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
