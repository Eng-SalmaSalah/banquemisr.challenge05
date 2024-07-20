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
    typealias VCCoordinatorDelegate = MoviesVCCoordinatorDelegate

    static func createViewController(arguments: MoviesCategory,
                                     coordinatorDelegate: MoviesVCCoordinatorDelegate) -> MoviesViewController {
        let moviesVM = createViewModel(moviesCategory: arguments)
        let moviesVC = MoviesViewController(viewModel: moviesVM)
        moviesVC.coordinatorDelegate = coordinatorDelegate
        return moviesVC
    }
    
    private static func createViewModel(moviesCategory: MoviesCategory) -> MoviesViewModelProtocol {
        return MoviesViewModel(moviesCategory: moviesCategory, fetchMoviesUseCase: getFetchMoviesUseCase())
    }
    
    private static func getFetchMoviesUseCase() -> FetchMoviesUseCase {
        return DefaultFetchMoviesUseCase(repo:  FetchMoviesRepositoryImpl())
    }
    
}
