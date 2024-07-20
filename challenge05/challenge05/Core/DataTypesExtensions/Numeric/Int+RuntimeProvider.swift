//
//  Int+RuntimeProvider.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

extension Int {
    var runtimeDescription: String {
        let hours = self / 60
        let minutes = self % 60
        let hrsLabel = hours > 1 ? "hrsTitle".localized : "hrTitle".localized
        let minsLabel = minutes > 1 ? "minsTitle".localized : "minTitle".localized
        return "\(hours) \(hrsLabel) \(minutes) \(minsLabel)"
    }
}
