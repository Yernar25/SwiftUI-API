//
//  ContentView.swift
//  Shop
//
//  Created by Yernar Dyussenbekov on 06.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State  var allCategories: [AllCategories]
    var body: some View {
        NavigationStack{
            List(allCategories) {categori in
                HStack{
                    Text(categori.name)
                    NavigationLink(destination: Products(url: categori.url)){
                        
                    }
                
                }
            }.onAppear(){
                fetchallCategories()
            }
            .listRowSpacing(16)
            .navigationTitle("category")
        }
        
    }
    
    func fetchallCategories() {
        guard let url = URL(string: "https://dummyjson.com/products/categories")
        else {
            print("Error")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("Error3")
                return
            }
            do {
                let decodedResponse = try JSONDecoder().decode([AllCategories].self, from: data)
                allCategories = decodedResponse
            } catch {
                print ("Ошибка: \(error.localizedDescription)")
            }
        }.resume()
    }
}

#Preview {
    ContentView(allCategories:[])
}

