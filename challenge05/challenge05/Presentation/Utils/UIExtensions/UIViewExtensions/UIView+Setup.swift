//
//  UIView+Setup.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIView {
    func setupWith(backgroundColor: UIColor, cornerRadius: CGFloat) {
        self.backgroundColor = backgroundColor
        setCornerRadius(radius: cornerRadius)
    }
    
    func setupWith(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.masksToBounds = true
    }
    
    func removeBorder() {
        layer.cornerRadius = 0
        layer.borderColor = nil
        layer.borderWidth = 0
    }
    
    func setCornerRadius(radius: CGFloat){
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    func roundTopCorners(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    func dropShadow(color: UIColor = .black,
                    opacity: Float = 0.25,
                    offset: CGSize = CGSize(width: 0, height: 4),
                    radius: CGFloat = 10) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
}
