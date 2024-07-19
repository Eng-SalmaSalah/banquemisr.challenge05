//
//  UIViewController+CustomAlertHandlers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showCustomAlert(customAlert: CustomAlertView) {
        if let window = UIApplication.shared.windows.first {
            window.showAlert(alertView: customAlert)
        }
    }
}
