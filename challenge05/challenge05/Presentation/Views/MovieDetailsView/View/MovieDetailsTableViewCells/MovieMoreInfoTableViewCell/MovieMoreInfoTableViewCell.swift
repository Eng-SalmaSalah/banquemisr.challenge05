//
//  MovieMoreInfoTableViewCell.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import UIKit

class MovieMoreInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoTitleLabel: CustomLabel!
    @IBOutlet weak var infoValueLabel: CustomLabel!
    
    func configureWith(infoTitle: String, infoValue: String) {
        infoTitleLabel.configureWith(value: infoTitle, theme: CustomLabelThemes.semiBold_primaryGrey_regular)
        infoValueLabel.configureWith(value: infoValue, theme: CustomLabelThemes.semiBold_black_regular)
    }

}
