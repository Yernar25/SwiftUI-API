//
//  ReviewsView.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 10.03.2025.
//

import SwiftUI

struct ReviewsView: View {
    @StateObject private var viewModel = ReviewsViewModel()
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
                            Text(viewModel.convertISODate(product.reviews![index].date))
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

}

//#Preview {
//    ReviewsView()
//}
