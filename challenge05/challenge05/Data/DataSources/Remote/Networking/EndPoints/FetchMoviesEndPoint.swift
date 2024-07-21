//
//  FetchMoviesEndPoint.swift
//  challenge05
//
//  Created by Salma Salah on 21/07/2024.
//

import Foundation

protocol FetchMoviesEndPoint: Endpoint {
    func setEndPointValues(category: MoviesCategory, pageNumber: Int)
}


