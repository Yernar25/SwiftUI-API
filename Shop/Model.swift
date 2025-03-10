//
//  Model.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 06.03.2025.
//

import Foundation
struct AllCategories: Codable, Identifiable {
    var id: String {slug}
    var slug: String
    var name: String
    var url: String
}

struct Product:Codable, Identifiable {
    var id: Int
    var category: String
    var title: String
    var description: String
    var price: Double
    var thumbnail: String
    var images: [String] = []
    var discountPercentage: Double
    var rating: Double
    var stock: Int = 0
    var brand: String?
    var warrantyInformation: String
    var reviews: [Reviews]?
    
}

struct Reviews: Codable {
    //var id = UUID()
    var rating: Int
    var comment: String
    var date: String
    var reviewerName: String
    var reviewerEmail: String
}

struct APIProduct: Codable {
    var products: [Product]
}



