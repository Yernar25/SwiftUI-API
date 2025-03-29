//
//  Products.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 06.03.2025.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel = ProductsViewModel()
    @State var urlProducts: String
    
    var body: some View {
        List(viewModel.products) { product in
            HStack{
                AsyncImage(url: URL(string: product.thumbnail)){ image in
                    switch image {
                    case .empty:
                        ProgressView()
                            .frame(width: 100, height: 100)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                    case .failure(_):
                        Image(systemName: "eyes")
                    @unknown default:
                        EmptyView()
                    }
                } 
                VStack (alignment: .leading){
                    Text(product.title)
                        .foregroundStyle(Color.gray)
                        .font(.subheadline)
                    NavigationLink(destination: ProductDetailView(product: product)){
                    }
                    HStack{
                        Text("\(product.price, specifier: "%.2f") $")
                            .bold()
                        Spacer()    
                    }
                    
                    HStack {
                        Text(String(product.rating))
                            .font(.system(size: 12))
                        
                        ForEach (0 ..< Int(round(product.rating)), id: \.self){ item in
                            Image("activeStar")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .lineSpacing(0)
                        }
                        ForEach (Int(round(product.rating))..<5, id: \.self) { item in
                            Image("inactiveStar")
                                .resizable()
                                .frame(width: 10, height: 10)
                        }
                        
                        Text("(\(product.reviews!.count))")
                            .font(.system(size: 12))
                            .foregroundStyle(Color.gray)
                    }
                }.navigationTitle(product.category)  
            }
        }.task {
            await viewModel.loadProducts(url: urlProducts)
        }
        .listRowSpacing(8)
    }
}



#Preview {
    ProductsView(urlProducts: "")
}
