//
//  MovieDetailsCoordinator.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class MovieDetailsCoordinator: Coordinator {
    var router: Router
    var movieDetailsViewArgs: MovieDetailsViewArgs
    
    init(router: Router, movieDetailsViewArgs: MovieDetailsViewArgs) {
        self.router = router
        self.movieDetailsViewArgs = movieDetailsViewArgs
    }
    
    func start() {
        goToMovieDetailsView()
    }
    
    private func goToMovieDetailsView() {
        let movieDetailsVC = MovieDetailsViewFactory.createViewController(arguments: movieDetailsViewArgs, coordinatorDelegate: self)
        router.present(movieDetailsVC, animated: true, presentationStyle: .overFullScreen, completion: nil)
    }
}

extension MovieDetailsCoordinator: MovieDetailsVCCoordinatorDelegate {
    func didExitMovieDetails() {
        dismiss()
    }
}
