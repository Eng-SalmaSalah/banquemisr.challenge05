//
//  PaginationLoadingTableViewCell.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import UIKit

class PaginationLoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.color = .primaryPeach
        }
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
    }

    override func prepareForReuse() {
        activityIndicator.stopAnimating()
    }
}
