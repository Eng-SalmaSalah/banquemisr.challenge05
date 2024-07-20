//
//  MoviesVCCoordinatorDelegate.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

protocol MoviesVCCoordinatorDelegate {
    func didSelectMovieWith(movieId: Int, movieName: String)
}
