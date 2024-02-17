//
//  HomeView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct HomeView: View {
  @State var categories: [CategoryResponse]?
  @State var products: [ProductResponse]?

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          LazyVGrid(columns:
            [
              GridItem(.flexible(minimum: 100, maximum: 200)),
              GridItem(.flexible(minimum: 100, maximum: 200))
            ], spacing: 24) {
              if let products = products {
                ForEach(products) { product in
                  NavigationLink(value: product) {
                    ProductView(product: product)
                  }
                }
              } else {
                // Placeholder
                ForEach(0 ..< 6) { _ in
                  Rectangle()
                    .foregroundStyle(.ultraThinMaterial)
                    .frame(width: 170, height: 250)
                }
              }
            }.padding()

          CustomSection("Shop by categories") {
            VStack {
              LazyVGrid(columns:
                [
                  GridItem(.flexible(minimum: 100, maximum: 200)),
                  GridItem(.flexible(minimum: 100, maximum: 200))
                ], spacing: 24) {
                  if let categories = categories {
                    ForEach(categories) { category in
                      Category(title: category.name, image: category.image)
                    }
                  } else {
                    // Placeholder
                    ForEach(0 ..< 6) { _ in
                      Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 170, height: 250)
                    }
                  }
                }
            }
          }
        }
      }
      .scrollIndicators(.hidden)
      .task {
        do {
          categories = try await NetworkService.getData(
            from: "https://api.escuelajs.co/api/v1/categories",
            withParams: ["type": "unknown", "name": "hello"])

          products = try await NetworkService.getData(
            from: "https://api.escuelajs.co/api/v1/products",
            withParams: ["limit": "8", "offset": "0"])
        } catch {
          print(error)
        }
      }.navigationDestination(for: ProductResponse.self) { product in
        DetailedView(product: product)
      }
    }
  }
}

#Preview {
  HomeView()
}
