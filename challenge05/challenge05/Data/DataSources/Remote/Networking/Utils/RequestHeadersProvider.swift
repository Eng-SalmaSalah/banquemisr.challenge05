//
//  RequestHeadersProvider.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class RequestHeadersProvider {
    static func getHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "Authorization": "Bearer \(TMDBConstants.accessToken)"]
    }
}
