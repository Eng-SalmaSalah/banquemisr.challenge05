//
//  EndPoint.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

/// Server endpoint interface, any server router should implement this interface to be able to connect
protocol Endpoint {
    /// Base URL
    var domainURL: String { get }
    
    /// The last path component to the endpoint. will be appended to the base url in the service
    var serviceURL: String { get }
    
    /// Reques parameters
    var parameters: [String: Any]? { get }

    /// The HTTP headers to be appended in the request
    var headers: [String: String] { get }

    /// HTTP method as specified by the server
    var method: HTTPMethod { get }
    
    /// Determind if you want to print the response in the consol or not
    var isPrintable: Bool { get }
}

extension Endpoint {
    var domainURL :String {
        return TMDBConstants.baseURL
    }
    
    /// Base url with serviceUrl
    var url: String {
        return domainURL + serviceURL
    }
    
    var isPrintable: Bool {
        return true
    }
    
    var headers: [String: String] {
        return RequestHeadersProvider.getHeaders()
    }

    func request(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        NetworkService.request(
            url: self.url,
            headers: self.headers,
            httpMethod: self.method,
            parameters: self.parameters,
            completion: completion
        )
    }
}
