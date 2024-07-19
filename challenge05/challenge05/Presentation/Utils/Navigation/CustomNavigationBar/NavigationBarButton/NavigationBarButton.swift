//
//  CustomButtonWithImage.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class NavigationBarButton: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var buttonImageView: UIImageView!
    @IBOutlet private weak var customButton: UIButton!
    @IBOutlet private weak var unreadNotificationsView: UIView!
    @IBOutlet private weak var unreadNotificationCountLabel: UILabel!
    @IBOutlet weak var buttonLabel: CustomLabel!
    private var actionClosure: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(NavigationBarButton.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    func configureWith(navButtonConfig: NavigationBarButtonConfig) {
        switch navButtonConfig {
        case .back(let action):
            setupBackNavButtonWith(image: navButtonConfig.buttonImage, action: action)
        case .skip(let action):
            setupSkipNavButtonWith(title: navButtonConfig.buttonLabelTitle ?? "", action: action)
        case .notification(let action):
            setupNotificationNavButtonWith(image: navButtonConfig.buttonImage, action: action)
        }
    }
   
    private func setupBackNavButtonWith(image: UIImage?, action: (() -> Void)?) {
        buttonLabel.isHidden = true
        
        buttonImageView.isHidden = false
        buttonImageView.image = image
        
        actionClosure = action
    }
    
    private func setupSkipNavButtonWith(title: String, action: (() -> Void)?) {
        buttonImageView.isHidden = true
        
        buttonLabel.isHidden = false
        buttonLabel.configureWith(value: title, theme: CustomLabelThemes.semiBold_black_regular)
        
        actionClosure = action
    }
    
    private func setupNotificationNavButtonWith(image: UIImage?, action: (() -> Void)?) {
        buttonLabel.isHidden = true

        buttonImageView.isHidden = false
        buttonImageView.image = image
        
        actionClosure = action
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        actionClosure?()
    }
}
