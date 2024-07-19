//
//  MoviesViewFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class MoviesViewFactory: ViewControllerFactory {
    typealias ViewController = MoviesViewController
    typealias ViewControllerArguments = MoviesCategory
    typealias VCCoordinatorDelegate = Any?

    static func createViewController(arguments: MoviesCategory,
                                     coordinatorDelegate: Any? = nil) -> MoviesViewController {
        return MoviesViewController()
    }
    
}
