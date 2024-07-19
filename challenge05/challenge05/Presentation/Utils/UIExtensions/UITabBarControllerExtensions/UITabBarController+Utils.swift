//
//  UITabBarController+Utils.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UITabBarController {
    func toggleLoading(isLoading: Bool) {
        isLoading ? startLoading() : stopLoading()
    }
    
    func showErrorAlert(error: Error) {
        showError(error: error)
    }
}
