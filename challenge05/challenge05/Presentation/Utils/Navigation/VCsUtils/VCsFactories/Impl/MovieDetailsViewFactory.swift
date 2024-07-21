//
//  MovieDetailsViewFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

struct MovieDetailsViewArgs {
    let movieId: Int
    let movieName: String
}

class MovieDetailsViewFactory: ViewControllerFactory {
    typealias ViewController = MovieDetailsViewController
    typealias ViewControllerArguments = MovieDetailsViewArgs
    typealias VCCoordinatorDelegate = MovieDetailsVCCoordinatorDelegate

    static func createViewController(arguments: MovieDetailsViewArgs,
                                     coordinatorDelegate: MovieDetailsVCCoordinatorDelegate) -> MovieDetailsViewController {
        let movieDetailsVM = createViewModel(arguments: arguments)
        let movieDetailsVC = MovieDetailsViewController(viewModel: movieDetailsVM)
        movieDetailsVC.coordinatorDelegate = coordinatorDelegate
        return movieDetailsVC
    }
    
    private static func createViewModel(arguments: MovieDetailsViewArgs) -> MovieDetailsViewModelProtocol {
        return MovieDetailsViewModel(movieId: arguments.movieId, 
                                     movieName: arguments.movieName,
                                     fetchMovieDetailsUseCase: getFetchMovieDetailsUseCase())
    }
    
    private static func getFetchMovieDetailsUseCase() -> FetchMovieDetailsUseCase {
        return DefaultFetchMovieDetailsUseCase(repo: getFetchMovieDetailsRepository())
    }
    
    private static func getFetchMovieDetailsRepository() -> FetchMovieDetailsRepository {
        return FetchMovieDetailsRepositoryImpl(fetchMovieDetailsEndPoint: FetchMovieDetailsEndPointImpl())
    }
    
}
