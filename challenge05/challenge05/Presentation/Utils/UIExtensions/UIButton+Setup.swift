//
//  UIButton+Styling.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIButton {
    func setupButtonView(buttonColor: UIColor , cornerRadius: CGFloat = 0) {
        backgroundColor = buttonColor
        if cornerRadius > 0 {
            setCornerRadius(radius: cornerRadius)
        }
    }
    
    func setupButtonText(title: String, titleColor: UIColor, titleFont: UIFont, isUnderlined: Bool) {
        let attributedTitle = title.getAttributedString(textColor: titleColor,
                                                        font: titleFont,
                                                        isUnderlined: isUnderlined)
        setAttributedTitle(attributedTitle, for: .normal)
    }
}
