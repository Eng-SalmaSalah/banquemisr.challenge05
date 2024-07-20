//
//  MovieMainDetailsCellViewModel.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

class MovieMainDetailsCellViewModel {
    let movieName: String
    let movieTagLine: String
    let moviePosterPath: String
    let movieReleaseDate: String
    let movieOverview: String
    let movieAverageRate: Double
    let movieRatingsNumber: Int
    let forAdults: Bool
    
    init(movieName: String, 
         movieTagLine: String,
         moviePosterPath: String,
         movieReleaseDate: String,
         movieOverview: String,
         movieAverageRate: Double,
         movieRatingsNumber: Int,
         forAdults: Bool) {
        self.movieName = movieName
        self.movieTagLine = movieTagLine
        self.moviePosterPath = moviePosterPath
        self.movieReleaseDate = movieReleaseDate
        self.movieOverview = movieOverview
        self.movieAverageRate = movieAverageRate
        self.movieRatingsNumber = movieRatingsNumber
        self.forAdults = forAdults
    }
}
