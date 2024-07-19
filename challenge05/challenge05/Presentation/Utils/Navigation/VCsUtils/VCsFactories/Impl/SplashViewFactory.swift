//
//  SplashViewFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

class SplashViewFactory: ViewControllerFactory {
    typealias ViewController = SplashViewController
    typealias ViewControllerArguments = Any?
    typealias VCCoordinatorDelegate = SplashVCCoordinatorDelegate
    
    static func createViewController(arguments: Any? = nil, 
                                     coordinatorDelegate: SplashVCCoordinatorDelegate) -> SplashViewController {
        let splashVC = SplashViewController()
        splashVC.coordinatorDelegate = coordinatorDelegate
        return splashVC
    }
}
