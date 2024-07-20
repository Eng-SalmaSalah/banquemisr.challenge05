//
//  MovieTableCellViewModel.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

class MovieTableCellViewModel {
    let movieId: Int
    let movieName: String
    let movieReleaseDate: String
    let moviePosterPath: String?
    
    init(movieId: Int, movieName: String, movieReleaseDate: String, moviePosterPath: String?) {
        self.movieId = movieId
        self.movieName = movieName
        self.movieReleaseDate = movieReleaseDate
        self.moviePosterPath = moviePosterPath
    }
}
