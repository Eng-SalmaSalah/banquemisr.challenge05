//
//  UIViewController+LoadingHandlers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    private var overlayTag: Int { return 999 }

    func bindLoadingState(showLoadingPublisher: AnyPublisher<Bool, Never>) -> AnyCancellable {
        return showLoadingPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] showLoading in
                guard let self = self else { return }
                if showLoading {
                    self.startLoading()
                } else {
                    self.stopLoading()
                }
            }
    }
    
    func startLoading(in frame: CGRect = UIScreen.main.bounds) {
        self.startActivityIndicator(frame: frame)
    }
    
    func stopLoading() {
        self.stopActivityIndicator()
    }
   
    private func startActivityIndicator(frame: CGRect) {
        DispatchQueue.main.async {
            
        }
    }
    
    private func stopActivityIndicator() {
        DispatchQueue.main.async {
            
        }
    }
}

