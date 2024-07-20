//
//  NetworkService.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class NetworkService {
    static func request(
        url: String,
        headers: [String: String],
        httpMethod: HTTPMethod,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<Data, NetworkError>) -> Void
    ) {
        
        guard let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else {
            print("❌ Network Service: Not Valid URL: \(url.description)")
            let invalidURLError = NetworkError.customError(message: "invalidURL".localized, errorStyle: .alertError)
            completion(.failure(invalidURLError))
            return
        }
        
        NetworkPrintHelper.logNetwork(
               """
               🙇‍♂️ \(httpMethod.rawValue.uppercased()) '\(url)':
               📝 Request headers = \(headers)
               📝 Request Body = \(String(describing: parameters))
               """
        )

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        
        if let parameters = parameters, httpMethod == .post {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                let requestFailedError = NetworkError.customError(message: error.localizedDescription, errorStyle: .alertError)
                completion(.failure(requestFailedError))
                return
            }
            
            guard let data = data else {
                let noDataFoundError = NetworkError.customError(message: "noDataFound".localized, errorStyle: .alertError)
                completion(.failure(noDataFoundError))
                return
            }
            
            NetworkPrintHelper.printRawResponse(data: data)
            completion(.success(data))
        }
        
        task.resume()
    }
}


