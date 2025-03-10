//
//  ReviewsView.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 10.03.2025.
//

import SwiftUI

struct ReviewsView: View {
    @State var product: Product
    var body: some View {
        List {
                ForEach (0..<product.reviews!.count, id: \.self) { index in
                    VStack {
                        HStack{
                            Text(product.reviews![index].reviewerName)
                            Spacer()
                            ForEach (0 ..< (product.reviews![index].rating), id: \.self){ item in
                                Image("activeStar")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                    .lineSpacing(0)
                            }
                            ForEach ((product.reviews![index].rating)..<5, id: \.self) { item in
                                Image("inactiveStar")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                        }
                        HStack{
                            Text(product.reviews![index].reviewerEmail)
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                            Spacer()
                            Text(convertISODate(product.reviews![index].date))
                                .font(.system(size: 12))
                                .foregroundStyle(Color.gray)
                        }
                        HStack {
                            Text(product.reviews![index].comment)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                    }
                }
        }
        .navigationTitle("Reviews")
    }
    
    func convertISODate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Поддержка миллисекунд
        
        if let date = formatter.date(from: isoDate) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd.MM.yyyy" // Формат, который тебе нужен
            return outputFormatter.string(from: date)
        }
        
        return "Invalid date"
    }
}

//#Preview {
//    ReviewsView()
//}
