//
//  UIFont+AppFontWithSize.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIFont {
    static func appRegularFont(withSize size: AppFontSize) -> UIFont {
        guard let appRegularFont = UIFont(name: AppFont.regular.rawValue, size: size.rawValue) else {
            return UIFont.systemFont(ofSize: size.rawValue, weight: .regular)
        }
        return appRegularFont
    }
    
    static func appSemiBoldFont(withSize size: AppFontSize) -> UIFont {
        guard let appSemiBoldFont = UIFont(name: AppFont.semiBold.rawValue, size: size.rawValue) else {
            return UIFont.systemFont(ofSize: size.rawValue, weight: .semibold)
        }
        return appSemiBoldFont
    }
    
    static func appBoldFont(withSize size: AppFontSize) -> UIFont {
        guard let appBoldFont = UIFont(name: AppFont.bold.rawValue, size: size.rawValue) else {
            return UIFont.systemFont(ofSize: size.rawValue, weight: .bold)
        }
        return appBoldFont
    }
}
