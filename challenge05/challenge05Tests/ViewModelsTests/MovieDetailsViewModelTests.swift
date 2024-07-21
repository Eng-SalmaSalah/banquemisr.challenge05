//
//  MovieDetailsViewModelTests.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
import XCTest
@testable import challenge05

final class MovieDetailsViewModelTests: XCTestCase {
    private var sut: MovieDetailsViewModel?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchMovieDetailsUseCase = MockedFetchMovieDetailsUseCase()
        sut = MovieDetailsViewModel(movieId: 519182,
                                    movieName: "Despicable Me 4",
                                    fetchMovieDetailsUseCase: mockedFetchMovieDetailsUseCase)
    }
    
    //MARK: - test methods
    func testFetchMoviesForCategory() {
        let expectedMovieDetails = MockedMovieDetailsResponseProvider.getMockedMovieDetailsResponse()
        
        sut?.getMovieDetails()
        
        XCTAssertNotNil(sut?.movieMainDetailsCellViewModel)
        XCTAssertNotNil(sut?.movieMoreInfoCellVMsList)
       
        XCTAssertEqual(sut?.movieMainDetailsCellViewModel?.movieName, expectedMovieDetails?.title)
        XCTAssertEqual(sut?.movieMainDetailsCellViewModel?.movieOverview, expectedMovieDetails?.overview)
        XCTAssertEqual(sut?.movieMainDetailsCellViewModel?.movieReleaseDate, expectedMovieDetails?.releaseDate)
        XCTAssertEqual(sut?.movieMainDetailsCellViewModel?.movieAverageRate, expectedMovieDetails?.voteAverage)

        if let statusInfoVM = sut?.movieMoreInfoCellVMsList?.filter({ $0.infoType == .status }).first {
            XCTAssertEqual(statusInfoVM.infoValue, expectedMovieDetails?.status)
        }

    }
}
