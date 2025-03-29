//
//  File.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 29.03.2025.
//

import Foundation
class AllCategoriesViewModel: ObservableObject {
    @Published var allCategories: [AllCategories] = []
    
    func loadAllCategories(url: String) async{
        do {
            let loadedCategoryes = try await NetworkManager.shared.fetchAllCategories(url: url)
            await MainActor.run {
                allCategories = loadedCategoryes
            }
        } catch {
            print("Error")
        }
    }

}
