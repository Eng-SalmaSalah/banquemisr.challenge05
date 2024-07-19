//
//  CustomLabel.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

class CustomLabel: UILabel, CustomControl {
    typealias ValueType = String
    typealias CustomThemeType = CustomLabelTheme
    
    func configureWith(value: String, theme: CustomLabelTheme) {
        self.text = value
        self.font = theme.font
        self.textColor = theme.textColor
    }
}


