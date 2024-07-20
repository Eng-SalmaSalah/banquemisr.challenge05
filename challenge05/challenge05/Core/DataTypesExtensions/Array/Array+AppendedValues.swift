//
//  Array+AppendedValues.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

extension Array where Element == String {
    func joinedWithSeparator(_ separator: String = " • ") -> String {
        return self.joined(separator: separator)
    }
}
