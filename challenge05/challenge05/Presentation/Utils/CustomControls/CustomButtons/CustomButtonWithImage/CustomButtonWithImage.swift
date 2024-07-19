//
//  CustomButtonWithImage.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class CustomButtonWithImage: UIView, CustomControl {
    typealias ValueType = (() -> Void)?
    typealias CustomThemeType = UIImage?
    
    private var buttonAction: (() -> Void)?
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var btnImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentView = loadViewFromNib(CustomButtonWithImage.nibName)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    func configureWith(value: (() -> Void)?, theme: UIImage?) {
        buttonAction = value
        btnImageView.image = theme
    }
    
    func updateImage(image: UIImage?) {
        btnImageView.image = image
    }
    
    @IBAction func didPressButton(_ sender: UIButton) {
        buttonAction?()
    }
    
}
