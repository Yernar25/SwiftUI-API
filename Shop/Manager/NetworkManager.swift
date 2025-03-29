//
//  NetworkManager.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 29.03.2025.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchAllCategories(url: String) async throws -> [AllCategories] {
        guard let url = URL(string: url) else {
            throw NSError(domain: "Bad URL", code: 1001, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode([AllCategories].self, from: data)
        return decodedResponse
    }
    
    func fetchProducts(url: String) async throws -> [Product] {
        guard let url = URL(string: url) else {
            throw NSError(domain: "Bad URL", code: 1001, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(APIProduct.self, from: data)
        return decodedResponse.products
    }
    
}
