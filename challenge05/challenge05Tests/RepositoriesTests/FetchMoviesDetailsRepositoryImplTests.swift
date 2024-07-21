//
//  FetchMoviesDetailsRepositoryImplTests.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
import XCTest
@testable import challenge05

class FetchMoviesDetailsRepositoryImplTests: XCTestCase {
    private var sut: FetchMovieDetailsRepositoryImpl?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchMovieDetailsEndPoint = MockedFetchMovieDetailsEndPoint()
        sut = FetchMovieDetailsRepositoryImpl(fetchMovieDetailsEndPoint: mockedFetchMovieDetailsEndPoint)
    }
    
    //MARK: - test methods
    func testFetchMovieDetailsWithId() {
        sut?.fetchMovieDetailsWith(movieId: 519182, completion: { [weak self] result in
            guard let self = self else {
                XCTFail("Sut failed to get movies")
                return
            }
            switch result {
            case .success(let movieDetailsResponse):
                self.validateResponse(movie: movieDetailsResponse)
            case .failure(let failure):
                XCTFail("Sut failed to get movies")
            }
        })
    }
    
    private func validateResponse(movie: Movie) {
        let expectedMovieDetails = MockedMovieDetailsResponseProvider.getMockedMovieDetailsResponse()
       
        XCTAssertEqual(movie.title, expectedMovieDetails?.title)
        XCTAssertEqual(movie.overview, expectedMovieDetails?.overview)
        XCTAssertEqual(movie.releaseDate, expectedMovieDetails?.releaseDate)
        XCTAssertEqual(movie.voteAverage, expectedMovieDetails?.voteAverage)
    }
}
