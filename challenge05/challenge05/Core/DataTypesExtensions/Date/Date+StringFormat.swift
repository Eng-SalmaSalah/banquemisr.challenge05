//
//  Date+StringFormat.swift
//  challenge05
//
//  Created by Salma Salah on 19/07/2024.
//

import Foundation

extension Date {
    func getStringDate(withFormat format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
