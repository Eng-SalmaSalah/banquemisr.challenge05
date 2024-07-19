//
//  Array+SafeBoundCheck.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
