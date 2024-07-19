//
//  CustomNavigationBarFactory.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

class CustomNavigationBarFactory {
    static func createNavigationBar(withNavBarConfigs navBarConfigs: NavigationBarConfigs) -> CustomNavigationBar{
        let customNavbar = CustomNavigationBar()
        customNavbar.configureWith(configs: navBarConfigs)
        return customNavbar
    }
}
