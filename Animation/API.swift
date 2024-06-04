//
//  API.swift
//  Animation
//
//  Created by KARMANI Aziza on 15/09/2023.
//

import SwiftUI
import Alamofire

struct API: View {
    
    @State private var products: [Product] = []
    
    private func fetchData() {
        // Parse URL
        guard let url = URL(string: "https://api.spoonacular.com/food/products/search?query=yogurt&apiKey=0a870f0bd45743ec8a70d450099da38e") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    // Parse JSON
                    let decodedData = try JSONDecoder().decode(ProductResponse.self, from: data)
                    self.products = decodedData.products // Mettez à jour vos données avec les produits
                    
                    // Vous pouvez accéder aux autres informations comme offset, number, totalProducts, etc.
                    // dans decodedData si nécessaire
                } catch {
                    // Print JSON decoding error
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            } else if let error = error {
                // Print API call error
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    var body: some View {
        
        List(products, id: \.id) { product in
                VStack {
                    Text(product.title)
                    if let imageUrl = URL(string: product.image) {
                        AsyncImage(url: imageUrl) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                            case .failure:
                                Text("Failed to load image")
                            @unknown default:
                                Text("Unknown image loading state")
                            }
                        }
                    }
                }
            }
           .onAppear {
               fetchData()
           }
    }
}

struct API_Previews: PreviewProvider {
    static var previews: some View {
        API()
    }
}


struct Post: Codable, Identifiable , Hashable{
      let id: Int
      let title: String
      let body: String
  }
struct ProductResponse: Codable {
    let type: String
    let products: [Product]
    let offset: Int
    let number: Int
    let totalProducts: Int
    let processingTimeMs: Int
}

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
