//
//  ImageDownloader.swift
//  challenge05
//
//  Created by Salma Salah on 20/07/2024.
//

import Foundation
import UIKit

class ImageDownloader {
    static let shared = ImageDownloader()
    private init() {}
    
    private let cache = NSCache<NSString, UIImage>()
    
    func downloadImage(from urlString: String, placeholderImage: UIImage?, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            completion(cachedImage)
            return
        }
        
        guard let url = URL(string: urlString)else {
            completion(placeholderImage)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(placeholderImage)
                return
            }
            
            self.cache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
}

