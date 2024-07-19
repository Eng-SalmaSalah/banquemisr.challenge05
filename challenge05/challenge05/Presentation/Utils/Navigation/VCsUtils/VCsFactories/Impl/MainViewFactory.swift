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
    typealias VCCoordinatorDelegate = Any?

    static func createViewController(arguments: Any? = nil,
                                     coordinatorDelegate: Any? = nil) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.setup()
        tabBarController.viewControllers = getTabbarViewControllers()
        return tabBarController
    }
    
    private static func getTabbarViewControllers() -> [UIViewController] {
        let nowPlayingVC = createMoviesViewController(for: .nowPlaying)
        nowPlayingVC.tabBarItem = UITabBarItem(title: "tabTitle_nowPlaying".localized,
                                               image: UIImage(named: "ic_nowPlaying"), selectedImage: nil)
        
        let popularVC = createMoviesViewController(for: .popular)
        popularVC.tabBarItem = UITabBarItem(title: "tabTitle_popular".localized,
                                            image: UIImage(named: "ic_popular"), selectedImage: nil)
        
        let upcomingVC = createMoviesViewController(for: .upcoming)
        upcomingVC.tabBarItem = UITabBarItem(title: "tabTitle_upcoming".localized,
                                             image: UIImage(named: "ic_upcoming"), selectedImage: nil)
        
        return [nowPlayingVC, popularVC, upcomingVC]
    }
    
    private static func createMoviesViewController(for category: MoviesCategory) -> MoviesViewController {
        MoviesViewFactory.createViewController(arguments: category)
    }
}
