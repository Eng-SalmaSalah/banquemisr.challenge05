//
//  NetworkError.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

enum NetworkError: Error {
    case customError(message: String, errorStyle: ErrorStyle)
    case serverError(message: String, errorCode: String)
    case rechabilityError(message: String)
}
