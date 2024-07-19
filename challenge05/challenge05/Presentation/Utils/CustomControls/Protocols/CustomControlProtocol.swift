//
//  CustomControlProtocol.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

protocol CustomControl {
    associatedtype ValueType
    associatedtype CustomThemeType
    
    func configureWith(value: ValueType, theme: CustomThemeType)
}


