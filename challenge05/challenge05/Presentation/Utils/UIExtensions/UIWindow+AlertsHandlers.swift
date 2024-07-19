//
//  UIWindow+AlertsHandlers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIWindow {
    func showAlert(alertView: CustomAlertView) {
        self.addConstrainedSubview(subview: alertView)
    }
    
    func showBannerAlert(bannerView: BannerErrorView) {
        self.addTopConstrainedView(subview: bannerView)
    }
    
    func removeErrorView(_ errorView: UIView) {
        errorView.removeFromSuperview()
    }
}
