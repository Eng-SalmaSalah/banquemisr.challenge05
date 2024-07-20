//
//  Double+RoundingHelpers.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

extension Double {
    var roundedString: String {
        return String(format: "%.2f", self)
    }
    
    var roundedToInt: Int {
        return Int(self.rounded())
    }
}
