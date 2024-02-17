//
//  TabBarCustomView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct TabBarCustomView: View {
  var vm: TabBarViewModel
  @EnvironmentObject var cart: Cart

  var body: some View {
    ZStack {
      Capsule()
        .foregroundStyle(.regularMaterial)
        .frame(height: 65)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: 10)

      HStack(spacing: 20) {
        ForEach(vm.tabs) { tab in
          Button {
            vm.selectedName = tab.name
          } label: {
            Image(systemName: tab.icon)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 25)
              .foregroundStyle(.black)

          }.padding()
            .overlay(alignment: .topTrailing) {
              if tab.badge && cart.items.count > 0 {
                ZStack {
                  Circle()
                    .fill(.black)
                    .stroke(.white, style: .init(lineWidth: 2))
                    .frame(width: 20)

                  Text("\(cart.items.count)")
                    .foregroundStyle(.white)
                    .font(.footnote)
                    .fontWeight(.bold)
                }.padding(10)
              }
            }
        }
      }

    }.padding(.horizontal)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  TabBarCustomView(vm: TabBarViewModel())
}
