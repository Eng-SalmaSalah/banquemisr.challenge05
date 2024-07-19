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
        let mainMoviesVC = MainViewFactory.createViewController()
        router.setRootModule(mainMoviesVC, animated: false, completion: nil)
    }
}
