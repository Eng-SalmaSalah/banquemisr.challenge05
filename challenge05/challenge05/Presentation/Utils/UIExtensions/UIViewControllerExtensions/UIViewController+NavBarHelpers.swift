//
//  UIViewController+NavBarHelpers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func add(navbar customNavbar: CustomNavigationBar, 
             above sibling: UIView,
             shouldSetTopConstraint: Bool = true,
             topCornerRadius: CGFloat = 0) {
        guard let containerView = view else { return }
        if topCornerRadius > 0 {
            customNavbar.roundTopCorners(radius: topCornerRadius)
        }
        containerView.addSubview(customNavbar)
        customNavbar.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = [
            customNavbar.bottomAnchor.constraint(equalTo: sibling.topAnchor),
            customNavbar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            customNavbar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            customNavbar.heightAnchor.constraint(equalToConstant: CustomNavigationBarConstants.navigationBarHeight)
        ]
        if shouldSetTopConstraint {
            let navbarTopConstant: CGFloat = UIDevice.hasNotch ? CustomNavigationBarConstants.topConstraintForDeviceWithNotch : 0
            constraints.append(customNavbar.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: navbarTopConstant))
        }
        NSLayoutConstraint.activate(constraints)
    }
    
    func add(navbar customNavbar: CustomNavigationBar,
             in sibling: UIView) {
        sibling.addConstrainedSubview(subview: customNavbar)
    }
}
