//
//  MovieMoreInfoCellViewModel.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

enum MovieMoreInfoCellInfoType {
    case originalTitle
    case genre
    case status
    case releaseDate
    case runtime
    case originCountry
    case originalLanguage
    case spokenLanguages
    case productionCountries
    case productionCompanies
    case budget
    case revenue
    
    var infoTitle: String {
        switch self {
        case .originalTitle:
            return "infoTitle_originalTitle".localized
            
        case .genre:
            return "infoTitle_genre".localized
            
        case .status:
            return "infoTitle_status".localized

        case .releaseDate:
            return "infoTitle_releaseDate".localized

        case .runtime:
            return "infoTitle_runtime".localized

        case .originCountry:
            return "infoTitle_originCountry".localized

        case .originalLanguage:
            return "infoTitle_originalLanguage".localized

        case .spokenLanguages:
            return "infoTitle_spokenLanguages".localized

        case .productionCountries:
            return "infoTitle_productionCountries".localized

        case .productionCompanies:
            return "infoTitle_productionCompanies".localized

        case .budget:
            return "infoTitle_budget".localized

        case .revenue:
            return "infoTitle_revenue".localized
        }
    }
}

class MovieMoreInfoCellViewModel {
    let infoType: MovieMoreInfoCellInfoType
    let infoValue: String
    
    init(infoType: MovieMoreInfoCellInfoType, infoValue: String) {
        self.infoType = infoType
        self.infoValue = infoValue
    }
}
