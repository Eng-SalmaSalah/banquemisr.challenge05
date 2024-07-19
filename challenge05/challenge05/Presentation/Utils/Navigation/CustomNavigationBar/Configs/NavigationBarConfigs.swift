//
//  NavigationBarConfigs.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

struct NavigationBarConfigs {
    let titleText: String?
    let leftButtonConfigs: NavigationBarButtonConfig?
    let rightButtonConfigs: NavigationBarButtonConfig?
    
    init(titleText: String? = nil,
         leftButtonConfigs: NavigationBarButtonConfig? = nil,
         rightButtonConfigs: NavigationBarButtonConfig? = nil) {
        self.titleText = titleText
        self.leftButtonConfigs = leftButtonConfigs
        self.rightButtonConfigs = rightButtonConfigs
    }
}
