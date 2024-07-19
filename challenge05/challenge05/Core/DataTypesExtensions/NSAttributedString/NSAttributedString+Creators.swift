//
//  NSAttributedString+Creators.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

extension NSAttributedString {
    static func concatenatedString(firstPart: String, firstTheme: CustomLabelTheme,
                                   secondPart: String, secondTheme: CustomLabelTheme) -> NSAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .font: firstTheme.font,
            .foregroundColor: firstTheme.textColor
        ]
        let secondAttributes: [NSAttributedString.Key: Any] = [
            .font: secondTheme.font,
            .foregroundColor: secondTheme.textColor
        ]
        let attributedFirstString = NSAttributedString(string: firstPart, attributes: firstAttributes)
        let attributedSecondString = NSAttributedString(string: secondPart, attributes: secondAttributes)
        
        let concatenatedString = NSMutableAttributedString()
        concatenatedString.append(attributedFirstString)
        concatenatedString.append(attributedSecondString)
        
        return concatenatedString
    }
}
