//
//  DefaultFetchMoviesUseCaseTests.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
import XCTest
@testable import challenge05

final class DefaultFetchMoviesUseCaseTests: XCTestCase {
    private var sut: DefaultFetchMoviesUseCase?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchMoviesRepository = MockedFetchMoviesRepository()
        sut = DefaultFetchMoviesUseCase(repo: mockedFetchMoviesRepository)
    }
    
    //MARK: - test methods
    func testFetchMoviesForCategory() {
        sut?.fetchMoviesWithCategory(category: .nowPlaying,
                                     pageNumber: 1,
                                     completion: { [weak self] result in
            guard let self = self else {
                XCTFail("Sut failed to get movies")
                return
            }
            switch result {
            case .success(let moviesResponse):
                self.validateResponse(moviesResponse: moviesResponse)
            case .failure(let failure):
                XCTFail("Sut failed to get movies")
            }
        })
    }
    
    private func validateResponse(moviesResponse: MoviesResponseModel) {
        let moviesResult = moviesResponse.results
        let expectedMovies = MockedMoviesResponseProvider.getMockedMoviesResponse()?.results

        XCTAssertNotNil(moviesResponse)
        XCTAssertEqual(moviesResult.count, expectedMovies?.count)
       
        XCTAssertEqual(moviesResult.first?.title, expectedMovies?.first?.title)
        XCTAssertEqual(moviesResult.first?.id, expectedMovies?.first?.id)

        XCTAssertEqual(moviesResult.last?.title, expectedMovies?.last?.title)
        XCTAssertEqual(moviesResult.last?.id, expectedMovies?.last?.id)
    }
}
