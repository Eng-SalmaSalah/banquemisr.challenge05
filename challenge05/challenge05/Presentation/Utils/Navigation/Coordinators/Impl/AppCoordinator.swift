//
//  AppCoordinator.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class AppCoordinator: Coordinator {
    var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func start() {
        launchApp()
    }
    
    private func launchApp() {
        let splashVC = SplashViewFactory.createViewController(coordinatorDelegate: self)
        router.setRootModule(splashVC, animated: false, completion: nil)
    }
    
    private func coordinateToMainView() {
        let mainMoviesCoordinator = CoordinatorsFactory.createMainMoviesCoordinatorWith(router: router)
        coordinateTo(coordinator: mainMoviesCoordinator)
    }
}

extension AppCoordinator: SplashVCCoordinatorDelegate {
    func didFinishSplash() {
        coordinateToMainView()
    }
}
