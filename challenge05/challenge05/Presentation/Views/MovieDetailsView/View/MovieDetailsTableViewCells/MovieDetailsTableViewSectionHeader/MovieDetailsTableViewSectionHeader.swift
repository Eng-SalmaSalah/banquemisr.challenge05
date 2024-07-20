//
//  AccountInfoSectionHeaderView.swift
//  user
//
//  Created by Salma Salah on 30/05/2024.
//

import Foundation
import UIKit

class MovieDetailsTableViewSectionHeader: UITableViewHeaderFooterView {

   @IBOutlet weak var sectionTitleLabel: CustomLabel!
    
    func configureWith(sectiontitle: String) {
        sectionTitleLabel.configureWith(value: sectiontitle, theme: CustomLabelThemes.bold_black_large)
    }

}
