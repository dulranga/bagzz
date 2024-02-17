//
//  DetailedView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct DetailedView: View {
  var product: ProductResponse
  @State var selectedTab: TabSections = .description
  @EnvironmentObject var cart: Cart

  var body: some View {
    ScrollView {
      HStack {
        AsyncImage(url: URL(string: product.images.first ?? "")) { Image in
          Image
            .resizable()
            .aspectRatio(contentMode: .fill)

        } placeholder: {
          ProgressView()
        }.frame(width: 170, height: 170)

        VStack(alignment: .leading, spacing: 15) {
          Text(product.title)
            .font(
              Font
                .custom("Playfair Display", size: 22)
                .weight(.bold)
            )

          Text("$\(product.price)")
            .font(
              Font
                .custom("Work Sans", size: 20)
                .weight(.bold)
            )

          CustomButton(label: "Buy Now", isWideButton: true) {}
          CustomButton(label: "Add to Cart", variant: .secondary, isWideButton: true) {
            cart.addItem(item: CartItem(id: product.id, name: product.title))
          }
        }
      }

      VStack(alignment: .leading, spacing: 15) {
        Picker("Selected Tab", selection: $selectedTab) {
          Text("Description").tag(TabSections.description)
          Text("Shipping Info").tag(TabSections.shipping)
          Text("Payment Options").tag(TabSections.payment)
        }.pickerStyle(.palette)

        ZStack {
          switch selectedTab {
          case .description: Text(product.description).multilineTextAlignment(.leading)
          case .payment: Rectangle()
          case .shipping: Rectangle()
          }
        }
        .font(Font.custom("Work Sans", size: 14))
        .foregroundColor(.secondary)

      }.padding(.vertical)

    }.padding()
  }
}

enum TabSections {
  case description, payment, shipping
}

#Preview {
  NavigationStack {
    DetailedView(product: ProductResponse.example)
  }
}
