//
//  NetworkService.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

class NetworkService {
    static func request<T: Codable>(
        url: String,
        headers: [String: String],
        httpMethod: HTTPMethod,
        parameters: [String: Any]? = nil,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = URL(string: url) else {
            let invalidURLError = NetworkError.customError(message: "InvalidURL".localized, errorStyle: .alertError)
            completion(.failure(invalidURLError))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let noDataFoundError = NetworkError.customError(message: "NoDataFound".localized, errorStyle: .alertError)
                completion(.failure(noDataFoundError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}


