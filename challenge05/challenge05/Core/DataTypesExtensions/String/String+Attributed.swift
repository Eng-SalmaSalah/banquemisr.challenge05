//
//  String+Attributed.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension String {
    func getAttributedString(textColor: UIColor,
                             font: UIFont,
                             isUnderlined: Bool) -> NSAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: font
        ]
        
        if isUnderlined {
            attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        
        return NSAttributedString(string: self, attributes: attributes)
    }
}
