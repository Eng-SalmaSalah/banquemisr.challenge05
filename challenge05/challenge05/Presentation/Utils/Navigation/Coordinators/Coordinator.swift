//
//  Coordinator.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

protocol Coordinator: AnyObject {
    var router: Router { get set }
    
    func start()
    func coordinateTo(coordinator: Coordinator)
    
    func goBack(animated: Bool)
    func dismiss(animated: Bool)
}

extension Coordinator {
    func coordinateTo(coordinator: Coordinator){
        coordinator.start()
    }
    func goBack(animated: Bool = true) {
        router.popModule(animated: animated, completion: nil)
    }
    
    func dismiss(animated: Bool = true) {
        router.dismissModule(animated: animated, completion: nil)
    }
}
