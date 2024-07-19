//
//  UIViewController+CreationHelpers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

extension UIViewController {
    static var xibName: String {
        return String(describing: self)
    }
}