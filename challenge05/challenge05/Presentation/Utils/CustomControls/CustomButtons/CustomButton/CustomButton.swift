//
//  CustomButton.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

class CustomButton: UIButton, CustomControl{
    typealias ValueType = String
    typealias CustomThemeType = CustomButtonTheme
    
    func configureWith(value: String, theme: CustomButtonTheme) {
        setupButtonView(buttonColor: theme.backgrountColor , cornerRadius: theme.cornerRadius)
        setupButtonText(title: value, 
                        titleColor: theme.titleColor,
                        titleFont: theme.font,
                        isUnderlined: theme.isUnderlined)
    }
}
