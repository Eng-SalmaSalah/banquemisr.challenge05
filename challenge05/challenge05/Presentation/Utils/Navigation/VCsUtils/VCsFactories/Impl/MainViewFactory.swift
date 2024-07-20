//
//  MainViewFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

class MainViewFactory: ViewControllerFactory {
    typealias ViewController = UITabBarController
    typealias ViewControllerArguments = Any?
    typealias VCCoordinatorDelegate = MoviesVCCoordinatorDelegate

    static func createViewController(arguments: Any? = nil,
                                     coordinatorDelegate: MoviesVCCoordinatorDelegate) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.setup()
        tabBarController.viewControllers = getTabbarViewControllers(coordinatorDelegate: coordinatorDelegate)
        return tabBarController
    }
    
    private static func getTabbarViewControllers(coordinatorDelegate: MoviesVCCoordinatorDelegate) -> [UIViewController] {
        let nowPlayingVC = createMoviesViewController(for: .nowPlaying, with: coordinatorDelegate)
        nowPlayingVC.tabBarItem = UITabBarItem(title: "tabTitle_nowPlaying".localized,
                                               image: UIImage(named: "ic_nowPlaying"), selectedImage: nil)
        
        let popularVC = createMoviesViewController(for: .popular,  with: coordinatorDelegate)
        popularVC.tabBarItem = UITabBarItem(title: "tabTitle_popular".localized,
                                            image: UIImage(named: "ic_popular"), selectedImage: nil)
        
        let upcomingVC = createMoviesViewController(for: .upcoming,  with: coordinatorDelegate)
        upcomingVC.tabBarItem = UITabBarItem(title: "tabTitle_upcoming".localized,
                                             image: UIImage(named: "ic_upcoming"), selectedImage: nil)
        
        return [nowPlayingVC, popularVC, upcomingVC]
    }
    
    private static func createMoviesViewController(for category: MoviesCategory, with coordinatorDelegate: MoviesVCCoordinatorDelegate) -> MoviesViewController {
        return MoviesViewFactory.createViewController(arguments: category, coordinatorDelegate: coordinatorDelegate)
    }
}
