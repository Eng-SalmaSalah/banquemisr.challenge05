//
//  CustomAlertView.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class CustomAlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var alertContainerView: UIView! {
        didSet {
            alertContainerView.setCornerRadius(radius: CornerRadius.regular.rawValue)
        }
    }
    @IBOutlet weak var alertTitleLabel: CustomLabel!
    @IBOutlet weak var alertMessageLabel: CustomLabel!
    @IBOutlet weak var alertPrimaryButton: CustomButton!
    
    private var primaryActionClosure: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(CustomAlertView.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    func configureWith(alertVM: CustomAlertViewModel) {
        alertTitleLabel.configureWith(value: alertVM.alertTitle,
                                      theme: CustomLabelThemes.bold_darkGrey_large)
        alertMessageLabel.configureWith(value: alertVM.alertMessage,
                                        theme: CustomLabelThemes.semiBold_primaryGrey_regular)
        alertPrimaryButton.configureWith(value: alertVM.alertPrimaryButtonTitle,
                                         theme: CustomButtonThemes.primary)
        self.primaryActionClosure = alertVM.alertPrimaryAction
        
    }
    
    @IBAction func didPressPrimaryButton(_ sender: UIButton) {
        if let primaryActionClosure = self.primaryActionClosure {
            removeFromSuperview()
            primaryActionClosure()
        }else {
            removeFromSuperview()
        }
    }
    
    @IBAction func didPressDismiss(_ sender: UIButton) {
        removeFromSuperview()
    }
}
