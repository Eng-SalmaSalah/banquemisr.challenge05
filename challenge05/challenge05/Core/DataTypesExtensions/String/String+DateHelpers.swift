//
//  String+DateHelpers.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

extension String {
    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    func getFormattedDate(inputFormat: String, outputFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        dateFormatter.locale = Locale(identifier: "en_EG")
        dateFormatter.timeZone = TimeZone(identifier: "Africa/Cairo")
        
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en")
        outputFormatter.dateFormat = outputFormat
        let formattedDateString = outputFormatter.string(from: date)
        return formattedDateString
    }
}
