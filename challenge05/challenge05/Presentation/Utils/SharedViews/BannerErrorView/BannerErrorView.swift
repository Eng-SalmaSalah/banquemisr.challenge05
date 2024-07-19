//
//  ConnectionErrorView.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class BannerErrorView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var errorMessageLabel: CustomLabel!
    @IBOutlet weak var dismissButton: CustomButton! {
        didSet {
            dismissButton.configureWith(value: "btn_Dismiss".localized,
                                        theme: CustomButtonThemes.whiteUnderlinedTitle)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configureWith(errorMessage: String) {
        errorMessageLabel.configureWith(value: errorMessage,
                                        theme: CustomLabelThemes.semiBold_white_regular)
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(BannerErrorView.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    @IBAction func didPressDismiss(_ sender: UIButton) {
        removeFromSuperview()
    }
}

