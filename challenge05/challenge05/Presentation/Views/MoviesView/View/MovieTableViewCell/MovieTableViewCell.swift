//
//  MovieTableViewCell.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: CustomLabel!
    @IBOutlet weak var releaseDateTitleLabel: CustomLabel! {
        didSet {
            releaseDateTitleLabel.configureWith(value: "releasedOn".localized,
                                                theme: CustomLabelThemes.semiBold_primaryGrey_regular)
        }
    }
    @IBOutlet weak var releaseDateValueLabel: CustomLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureWith(cellVM: MovieTableCellViewModel) {
        contentView.isUserInteractionEnabled = true
        isAccessibilityElement = true

        moviePosterImageView.image = UIImage(named: "movieImage")

        movieNameLabel.configureWith(value: cellVM.movieName,
                                     theme: CustomLabelThemes.bold_black_large)
        releaseDateValueLabel.configureWith(value: cellVM.movieReleaseDate,
                                            theme: CustomLabelThemes.semiBold_primaryGrey_regular)
    }
    
    func downloadImageWith(urlString: String, completionHandler: @escaping (UIImage?) -> Void) {
        ImageDownloader.shared.downloadImage(from: urlString, placeholderImage: UIImage(named: "movieImage"), completion: completionHandler)
    }
}
