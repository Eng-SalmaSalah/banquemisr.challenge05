//
//  FetchMovieDetailsEndPoint.swift
//  challenge05
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation

protocol FetchMovieDetailsEndPoint: Endpoint {
    func setEndPointValues(movieId: Int)
}
