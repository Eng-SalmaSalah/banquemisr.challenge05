//
//  UIViewController+CombineHelpers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    func removeBinding(cancellables: inout Set<AnyCancellable>) {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
