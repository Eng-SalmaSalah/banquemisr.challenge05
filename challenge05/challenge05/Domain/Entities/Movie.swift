//
//  Movie.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let releaseDate: String
    let voteAverage: Double?
    let posterPath: String?
    let overview: String?
    let originalTitle: String?
    let adult: Bool?
    let genres: [Genre]?
    let originCountry: [String]?
    let originalLanguage: String?
    let spokenLanguages: [SpokenLanguage]?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let runtime: Int?
    let tagline: String?
    let voteCount: Int?
    let revenue: Double?
    let budget: Double?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case overview
        case originalTitle = "original_title"
        case adult
        case genres
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case spokenLanguages = "spoken_languages"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case runtime
        case tagline
        case voteCount = "vote_count"
        case revenue
        case budget
        case status
    }
}

struct Genre: Codable {
    let name: String
}

struct ProductionCompany: Codable {
    let name: String
}

struct ProductionCountry: Codable {
    let name: String
}

struct SpokenLanguage: Codable {
    let englishName: String
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
    }
}

