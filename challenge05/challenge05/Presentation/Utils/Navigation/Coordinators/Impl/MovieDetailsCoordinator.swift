//
//  MovieDetailsCoordinator.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class MovieDetailsCoordinator: Coordinator {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        goToMovieDetailsView()
    }
    
    private func goToMovieDetailsView() {
   
    }
}
