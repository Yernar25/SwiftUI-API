//
//  ProductDetailView.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 09.03.2025.
//

import SwiftUI
import SnapKit
struct ProductDetailView: View {
    @State var product: Product
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea(.all)
            ScrollView(.vertical) {
                if (product.images.count > 1) {
                    ScrollView (.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(0..<(product.images.count), id: \.self){ index in
                                AsyncImage(url: URL(string: product.images[index])){ image in
                                    switch image {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 380, height: 260)
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 300, height: 260)
                                            .shadow(color: .gray ,radius: 16)
                                            .padding(.leading)
                                            .background(Color.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 8), style: FillStyle())
                                    case .failure(_):
                                        Image(systemName: "eyes")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            
                        }
                        .padding(.leading)
                    } .scrollIndicators(.visible)//ScrollView (.horizontal)
                } else {
                    AsyncImage(url: URL(string: product.images[0])){ image in
                        switch image {
                        case .empty:
                            ProgressView()
                                .frame(width: 380, height: 260)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 260)
                                .shadow(color: .gray ,radius: 16)
                                .padding(.leading)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 8), style: FillStyle())
                        case .failure(_):
                            Image(systemName: "eyes")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack{
                    Text(product.title)
                        .font(.title)
                    Text(product.description)
                        .font(.subheadline)
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack{
                    HStack {
                        Text("Price: ")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("\(product.price, specifier: "%.2f") $")
                    }.padding(.bottom)
                    
                    HStack {
                        Text("Discount Percentage: ")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(String(product.discountPercentage))
                    }.padding(.bottom)
                    
                    HStack {
                        Text("Rating: ")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(String(product.rating))
                    }.padding(.bottom)
                    
                    HStack {
                        Text("Brand: ")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(product.brand ?? "No brand")
                    }.padding(.bottom)
                    
                    HStack {
                        Text("Warranty: ")
                            .foregroundStyle(.gray)
                        Spacer()
                        Text(product.warrantyInformation)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack {
                    if let reviews = product.reviews{
                        HStack {
                            Text("Rewiews")
                                .frame(alignment: .leading)
                            Spacer()
                            NavigationLink(destination: ReviewsView(product: product)) {
                                Text("See all")
                                    .padding()
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        HStack {
                            Text(reviews.first!.reviewerName + ":")
                            Spacer()
                            Text(reviews.first!.comment)
                                .foregroundStyle(Color(.gray))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            
        }
        HStack{
            AsyncImage(url: URL(string: product.thumbnail)){ image in
                switch image {
                case .empty:
                    ProgressView()
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Rectangle(), style: /*@START_MENU_TOKEN@*/FillStyle()/*@END_MENU_TOKEN@*/)
                case .failure(_):
                    Image(systemName: "eyes")
                @unknown default:
                    EmptyView()
                }
            }
            Spacer()
            
            Text("\(product.price, specifier: "%.2f") $")
            
            Button(" Buy "){
            }
            .font(.largeTitle)
            
            .frame(width: 80, height: 40, alignment: .center)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8), style: FillStyle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.5), radius: 3, x: 5, y: 0)
    }
}

//#Preview {
//    ProductDetailView()
//}
