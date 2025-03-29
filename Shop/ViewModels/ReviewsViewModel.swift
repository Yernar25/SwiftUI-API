//
//  ReviewsViewModel.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 29.03.2025.
//

import Foundation
class  ReviewsViewModel: ObservableObject  {
    
    func convertISODate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Поддержка миллисекунд
        if let date = formatter.date(from: isoDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy" // Формат
            return outputFormatter.string(from: date)
        }
        return "Invalid date"
    }
}
