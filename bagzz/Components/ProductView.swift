//
//  ProductView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct ProductView: View {
  var product: ProductResponse

  var body: some View {
    ZStack(alignment: .topTrailing) {
      VStack {
        AsyncImage(url: URL(string: product.images.first ?? "")) { Image in
          Image
            .resizable()
            .aspectRatio(contentMode: .fill)

        } placeholder: {
          ProgressView()
        }
        .frame(width: 110, height: 110)

        Text(product.title)
          .font(
            Font.custom("Playfair Display", size: 18)
              .weight(.bold)
          ).multilineTextAlignment(.center)
          .lineLimit(2)
          .frame(maxWidth: 180)

        Button("Shop Now".uppercased()) {}
          .buttonStyle(.plain)
          .underline()
          .padding(.vertical, 6)
          .padding(.horizontal, 24)
      }
      .padding()
      .background(.thinMaterial)

      Button("favourite", systemImage: "heart") {}.labelStyle(.iconOnly).foregroundStyle(.font).padding(10)
    }.foregroundStyle(.font)
  }
}

struct ProductResponse: Codable, Identifiable, Hashable {
  var id: Int
  var title: String
  var price: Int
  var description: String
  var images: [String]
  var creationAt: String
  var updatedAt: String
  var category: CategoryResponse

  static var example = ProductResponse(
    id: 150,
    title: "Nuevo título",
    price: 120,
    description: "Nueva descripción",
    images: [],
    creationAt: "2024-02-16T12:05:41.000Z",
    updatedAt: "2024-02-16T12:05:41.000Z",
    category: CategoryResponse(
      id: 5,
      name: "Miscellaneous",
      image: "https://i.imgur.com/BG8J0Fj.jpg",
      creationAt: "2024-02-16T12:05:41.000Z",
      updatedAt: "2024-02-16T12:05:41.000Z"
    )
  )
}

#Preview {
  ProductView(product: .example)
}

#Preview("long name") {
  ProductView(product: .example)
}
