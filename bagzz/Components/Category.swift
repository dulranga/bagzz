//
//  Category.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct Category: View {
  var title: String
  var image: String

  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      AsyncImage(url: URL(string: image)) { Image in
        Image
          .resizable()
          .aspectRatio(contentMode: .fill)

      } placeholder: {
        ProgressView()
      }
      .frame(width: 170, height: 250)
      .clipped()

      Text(title)
        .font(
          Font.custom("Playfair Display", size: 16)
            .weight(.bold)
        )
        .foregroundStyle(.white)
        .padding()
        .background(Rectangle())
    }
  }
}

struct CategoryResponse: Codable, Identifiable, Hashable {
  var id: Int
  var name: String
  var image: String
  var creationAt: String
  var updatedAt: String
}

#Preview {
  Category(title: "Handle bags", image: "https://picsum.photos/400/300")
}
