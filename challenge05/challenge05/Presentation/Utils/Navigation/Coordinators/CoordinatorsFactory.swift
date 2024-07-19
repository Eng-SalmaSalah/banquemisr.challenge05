//
//  CoordinatorsFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class CoordinatorsFactory {
    static func createMainMoviesCoordinatorWith(router: Router) -> MoviesMainCoordinator {
        let mainMoviesCoordinator = MoviesMainCoordinator(router: router)
        return mainMoviesCoordinator
    }
}
