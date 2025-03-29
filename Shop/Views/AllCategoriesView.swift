//
//  ContentView.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 06.03.2025.
//

import SwiftUI

struct AllCategoriesView: View {
    @StateObject private var viewModel = AllCategoriesViewModel()
    private let urlCategoryes: String = "https://dummyjson.com/products/categories"
    
    var body: some View {
        NavigationStack{
            List(viewModel.allCategories) {categori in
                HStack{
                    Text(categori.name)
                    NavigationLink(destination: ProductsView(urlProducts: categori.url)){
                    }
                }
            }
            .task {
                await viewModel.loadAllCategories(url: urlCategoryes)
            }
            .listRowSpacing(16)
            .navigationTitle("category")
        }
    }
    
}

#Preview {
    AllCategoriesView()
}

