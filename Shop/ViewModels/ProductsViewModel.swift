//
//  ProductsViewModel.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 29.03.2025.
//

import Foundation
class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func loadProducts(url: String) async{
        do {
            let loadedProducts = try await NetworkManager.shared.fetchProducts(url: url)
            await MainActor.run {
                products = loadedProducts
            }
        } catch {
            print("Error")
        }
    }
    
}
