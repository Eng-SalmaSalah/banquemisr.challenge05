//
//  UIViewController+ErrorHandlers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation
import UIKit
import Combine

extension UIViewController {
    func bindUIErrorState(showErrorPublisher: AnyPublisher<Error, Never>) -> AnyCancellable {
        return showErrorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] error in
                guard let self = self else { return }
                self.showError(error: error)
            }
    }
    
    func showError(error: Error , alertPrimaryAction: (() -> Void)? = nil) {
        if let customError = error as? NetworkError {
            switch customError {
            case .customError(let message , let errorStyle):
                errorStyle == .alertError ? showAlertError(errorMessage: message, alertPrimaryAction: alertPrimaryAction) : showBannerError(errorMessage: message)
            case .serverError(let message, _):
                showAlertError(errorMessage: message, alertPrimaryAction: alertPrimaryAction)
            case .rechabilityError(let message):
                showBannerError(errorMessage: message)
            }
        }else {
            showAlertError(errorMessage: error.localizedDescription, alertPrimaryAction: alertPrimaryAction)
        }
    }

    private func showAlertError(errorMessage: String, alertPrimaryAction: (() -> Void)?) {
        let alertVM = CustomAlertViewModel(alertTitle: "errorAlertTitle".localized,
                                           alertMessage: errorMessage,
                                           alertPrimaryButtonTitle: "btn_Ok".localized,
                                           alertPrimaryAction: alertPrimaryAction)
        let customAlert = CustomAlertView()
        customAlert.configureWith(alertVM: alertVM)
        if let window = UIApplication.shared.windows.first {
            window.showAlert(alertView: customAlert)
        }
    }
    
    private func showBannerError(errorMessage: String) {
        let bannerErrorView = BannerErrorView()
        bannerErrorView.configureWith(errorMessage: errorMessage)
        if let window = UIApplication.shared.windows.first {
            window.showBannerAlert(bannerView: bannerErrorView)
        }
    }
    
}
