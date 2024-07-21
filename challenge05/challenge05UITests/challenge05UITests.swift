//
//  challenge05UITests.swift
//  challenge05UITests
//
//  Created by Salma Salah on 19/07/2024.
//

import XCTest

final class challenge05UITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAppFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Test if splash screen is shown
        let splashImage = app.images["appLogoImageView"]
        XCTAssertTrue(splashImage.waitForExistence(timeout: 10), "Splash image should be visible")
        
        // Test if movies table view is rendered
        let moviesTableView = app.tables["MoviesTableView"]
        XCTAssertTrue(moviesTableView.waitForExistence(timeout: 15), "Movies table view should exist")
        
        // Test if navigation to details is successful
        let firstTableCell = moviesTableView.cells.firstMatch
        XCTAssertTrue(firstTableCell.waitForExistence(timeout: 10), "First table cell should be visible")
        firstTableCell.tap()

        let movieNameLabel = app.staticTexts["MovieNameLabel"]
        XCTAssertTrue(movieNameLabel.waitForExistence(timeout: 10), "Movie name label should be visible so details screen is open")
        
        // Test if back navigation works
        let backButton = app.buttons["NavBarButton"]
        XCTAssertTrue(backButton.waitForExistence(timeout: 10), "Back button should be visible")
        backButton.tap()
        
        XCTAssertTrue(moviesTableView.waitForExistence(timeout: 15), "Movies table view should be visible after navigating back")
    }
}

