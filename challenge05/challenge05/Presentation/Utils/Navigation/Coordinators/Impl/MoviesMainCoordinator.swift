//
//  MoviesMainCoordinator.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class MoviesMainCoordinator: Coordinator {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        goToMoviesView()
    }
    
    private func goToMoviesView() {
        let mainMoviesVC = MainViewFactory.createViewController(coordinatorDelegate: self)
        router.setRootModule(mainMoviesVC, animated: false, completion: nil)
    }
    
    private func coordinateToMovieDetails(args: MovieDetailsViewArgs) {
        let movieDetailsCoordinator = CoordinatorsFactory.createMovieDetailsCoordinatorWith(router: router, movieDetailsViewArgs: args)
        coordinateTo(coordinator: movieDetailsCoordinator)
    }
}

extension MoviesMainCoordinator: MoviesVCCoordinatorDelegate {
    func didSelectMovieWith(movieId: Int, movieName: String) {
        coordinateToMovieDetails(args: MovieDetailsViewArgs(movieId: movieId, movieName: movieName))
    }
}
