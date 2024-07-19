//
//  UIDevice+Helpers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIDevice {
    /// Returns `true` if the device has a notch
    static var hasNotch: Bool {
        if let window = UIApplication.shared.windows.first {
            let topSafeAreaInset = window.safeAreaInsets.top
            let bottomSafeAreaInset = window.safeAreaInsets.bottom
            
            if topSafeAreaInset > 20 || bottomSafeAreaInset > 0 {
                return true
            } else {
                return false
            }
        }
        return true
    }
}
