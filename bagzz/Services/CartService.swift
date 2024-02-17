//
//  CartService.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-17.
//

import Foundation

final class Cart: ObservableObject {
  @Published var items: [CartItem] = []

  func addItem(item: CartItem) {
    items.append(item)
  }
}

struct CartItem {
  var id: Int
  var name: String
}
