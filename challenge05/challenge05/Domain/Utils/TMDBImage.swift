//
//  TMDBImage.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation

struct TMDBImage {
    static let baseURL = "https://image.tmdb.org/t/p/"
    
    enum Size: String {
        case w300 = "w300"
        case w780 = "w780"
    }
    
    static func imageURL(forPath path: String, size: Size) -> String {
        return "\(baseURL)\(size.rawValue)\(path)"
    }
}
