//
//  CustomButtonTheme.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

struct CustomButtonTheme {
    let font: UIFont
    let titleColor: UIColor
    let backgrountColor: UIColor
    let cornerRadius: CGFloat
    let isUnderlined: Bool
    
    init(font: UIFont,
         titleColor: UIColor,
         backgrountColor: UIColor,
         cornerRadius: CGFloat = 0,
         isUnderlined: Bool = false) {
        self.font = font
        self.titleColor = titleColor
        self.backgrountColor = backgrountColor
        self.cornerRadius = cornerRadius
        self.isUnderlined = isUnderlined
    }
}

struct CustomButtonThemes {
    static let primary = CustomButtonTheme(font: UIFont.appBoldFont(withSize: .regular),
                                           titleColor: .white,
                                           backgrountColor: .primaryPeach,
                                           cornerRadius: CornerRadius.large.rawValue)
    
    static let secondary = CustomButtonTheme(font: UIFont.appBoldFont(withSize: .regular),
                                             titleColor: .white,
                                             backgrountColor: .mediumGrey,
                                             cornerRadius: CornerRadius.large.rawValue)

    static let whiteTitle = CustomButtonTheme(font: UIFont.appBoldFont(withSize: .large),
                                              titleColor: .white,
                                              backgrountColor: .clear)

    
    static let whiteUnderlinedTitle = CustomButtonTheme(font: UIFont.appBoldFont(withSize: .large),
                                                        titleColor: .white,
                                                        backgrountColor: .clear,
                                                        isUnderlined: true)

}
