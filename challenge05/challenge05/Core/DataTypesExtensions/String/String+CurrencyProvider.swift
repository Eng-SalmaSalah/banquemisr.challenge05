//
//  String+CurrencyProvider.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

extension String {
    func currencyCode() -> String? {
        let locale = Locale(identifier: Locale.identifier(fromComponents: [NSLocale.Key.countryCode.rawValue: self]))
        return locale.currencyCode
    }
}
