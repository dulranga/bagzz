//
//  HeaderView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct HeaderView: View {
  var userImageUrl = "https://api.dicebear.com/7.x/bottts/png"

  var body: some View {
    HStack {
      Text("bagzz")
        .font(
          .custom("Playfair Display", size: 24)
        )
        .fontWeight(.bold)

      Spacer()
      Button(action: {}, label: {
        
      
        AsyncImage(url: URL(string: userImageUrl)) { image in
          image.resizable()
        } placeholder: {
          ProgressView()
        }

        .frame(width: 32, height: 32)
      })

    }.padding()
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  HeaderView()
}
