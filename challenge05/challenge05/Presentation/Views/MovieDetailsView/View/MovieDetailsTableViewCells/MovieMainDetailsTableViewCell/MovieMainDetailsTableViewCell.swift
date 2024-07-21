//
//  MovieMainDetailsTableViewCell.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import UIKit

class MovieMainDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: CustomLabel! {
        didSet {
            movieNameLabel.accessibilityIdentifier = "MovieNameLabel"
        }
    }
    @IBOutlet weak var movieTagLineLabel: CustomLabel!
    @IBOutlet weak var movieReleaseDateLabel: CustomLabel!
    @IBOutlet weak var movieAverageRateLabel: CustomLabel!
    @IBOutlet weak var overviewTitleLabel: CustomLabel! {
        didSet {
            overviewTitleLabel.configureWith(value: "overviewTitle".localized,
                                             theme: CustomLabelThemes.bold_black_large)
        }
    }
    @IBOutlet weak var overviewLabel: CustomLabel!
    @IBOutlet weak var forAdultsView: UIView!
    @IBOutlet weak var forAdultsLabel: CustomLabel!
    
    func configureWithCellVM(cellVM: MovieMainDetailsCellViewModel) {
        movieNameLabel.configureWith(value: cellVM.movieName,
                                     theme: CustomLabelThemes.bold_black_large)
        movieTagLineLabel.configureWith(value: cellVM.movieTagLine,
                                        theme: CustomLabelThemes.semiBold_primaryGrey_regular)
        movieReleaseDateLabel.configureWith(value: cellVM.movieReleaseDate,
                                            theme: CustomLabelThemes.semiBold_black_regular)
        overviewLabel.configureWith(value: cellVM.movieOverview,
                                    theme: CustomLabelThemes.semiBold_primaryGrey_regular)
        configurePosterImage(posterPath: cellVM.moviePosterPath)
        configureForAdultsView(forAdults: cellVM.forAdults)
        configureRatingLabel(movieAverageRate: cellVM.movieAverageRate, movieRatingsNumber: cellVM.movieRatingsNumber)
    }
    
    private func configurePosterImage(posterPath: String) {
        ImageDownloader.shared.downloadImage(from: TMDBImage.imageURL(forPath: posterPath, size: .w780), placeholderImage: UIImage(named: "movieImage")) { posterImage in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.moviePosterImageView.image = posterImage
            }
        }
    }
    
    private func configureForAdultsView(forAdults: Bool) {
        if forAdults {
            forAdultsView.isHidden = false
            forAdultsLabel.configureWith(value: "forAdults".localized, theme: CustomLabelThemes.semiBold_white_regular)
        }else {
            forAdultsView.isHidden = true
        }
    }
    
    private func configureRatingLabel(movieAverageRate: Double, movieRatingsNumber: Int) {
        let averageRate = movieAverageRate.roundedString
        let votes = "(\(movieRatingsNumber) \("ratings".localized))"
        let labelText = "\(averageRate) \(votes)"
        movieAverageRateLabel.configureWith(value: labelText,
                                            theme: CustomLabelThemes.semiBold_black_regular)
    }
}
