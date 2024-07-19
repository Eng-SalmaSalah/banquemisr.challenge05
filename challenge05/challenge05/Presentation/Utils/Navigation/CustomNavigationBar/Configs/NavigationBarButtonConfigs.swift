//
//  NavigationBarButtonConfigs.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit

enum NavigationBarButtonConfig {
    case back(action: (() -> Void)?)
    case skip(action: (() -> Void)?)
    case notification(action: (() -> Void)?)
    
    var buttonImage: UIImage? {
        switch self {
        case .back:
            return UIImage(named: "ic_back")
        case .notification:
            return UIImage(named: "ic_notification")
        default:
            return nil
        }
    }
    
    var buttonLabelTitle: String? {
        switch self {
        case .skip:
            return "btn_Skip".localized
        default:
            return nil
        }
    }
}

