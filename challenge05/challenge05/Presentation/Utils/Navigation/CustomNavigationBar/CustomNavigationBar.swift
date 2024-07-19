//
//  CustomNavigationBar.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class CustomNavigationBar: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private(set) weak var navBarTitle: CustomLabel!
    @IBOutlet private weak var navBarLeftButton: NavigationBarButton!
    @IBOutlet private weak var navBarRightButton: NavigationBarButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(CustomNavigationBar.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    func configureWith(configs: NavigationBarConfigs) {
        configureTitle(titleText: configs.titleText)
        configureButton(navBarButton: navBarLeftButton, buttonConfig: configs.leftButtonConfigs)
        configureButton(navBarButton: navBarRightButton, buttonConfig: configs.rightButtonConfigs)
    }
    
    private func configureTitle(titleText: String?) {
        guard let titleText = titleText else {
            navBarTitle.isHidden = true
            return
        }
        navBarTitle.configureWith(value: titleText, theme: CustomLabelThemes.bold_darkGrey_large)
    }
    
    private func configureButton(navBarButton: NavigationBarButton, buttonConfig: NavigationBarButtonConfig?) {
        guard let buttonConfig = buttonConfig else {
            navBarButton.isHidden = true
            return
        }
        navBarButton.isHidden = false
        navBarButton.configureWith(navButtonConfig: buttonConfig)
    }
}
