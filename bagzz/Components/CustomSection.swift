//
//  CustomSection.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct CustomSection<Content>: View where Content: View {
  var title: String
  var content: () -> Content

  init(_ title: String, content: @escaping () -> Content) {
    self.title = title
    self.content = content
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text("Shop by categories")
        .font(
          Font.custom("Playfair Display", size: 24)
        )

      content()
    }.padding()
  }
}

#Preview {
  CustomSection("Shop by categories") {
    Rectangle()
  }
}
