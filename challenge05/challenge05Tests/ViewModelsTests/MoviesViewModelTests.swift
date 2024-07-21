//
//  MoviesViewModelTests.swift
//  challenge05Tests
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation
import XCTest
@testable import challenge05

final class MoviesViewModelTests: XCTestCase {
    private var sut: MoviesViewModel?
    
    override func setUp() {
        prepareSut()
    }

    override func tearDown() {
        sut = nil
    }
    
    private func prepareSut() {
        let mockedFetchMoviesUseCase = MockedFetchMoviesUseCase()
        sut = MoviesViewModel(moviesCategory: .nowPlaying, fetchMoviesUseCase: mockedFetchMoviesUseCase)
    }
    
    //MARK: - test methods
    func testFetchMoviesForCategory() {
        let expectedMovies = MockedMoviesResponseProvider.getMockedMoviesResponse()?.results
        
        sut?.fetchMoviesForCategory(shouldShowLoading: false)
        
        XCTAssertNotNil(sut?.movieCellVMsList)
        XCTAssertEqual(sut?.movieCellVMsList.count, expectedMovies?.count)
       
        XCTAssertEqual(sut?.movieCellVMsList.first?.movieName, expectedMovies?.first?.title)
        XCTAssertEqual(sut?.movieCellVMsList.first?.movieId, expectedMovies?.first?.id)

        XCTAssertEqual(sut?.movieCellVMsList.last?.movieName, expectedMovies?.last?.title)
        XCTAssertEqual(sut?.movieCellVMsList.last?.movieId, expectedMovies?.last?.id)

    }
}
