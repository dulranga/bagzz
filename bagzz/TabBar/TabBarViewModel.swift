//
//  TabBarViewModel.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-15.
//

import Foundation
import SwiftUI

final class TabBarViewModel: ObservableObject {
  @Published var selectedName: String = "home"

  let tabs: [TabItem] = [
    TabItem(name: "home", content: HomeView(), icon: "house"),
    TabItem(name: "search", content: Rectangle(), icon: "magnifyingglass"),
    TabItem(name: "favourite", content: Rectangle(), icon: "heart.fill"),
    TabItem(name: "shopping", content: Rectangle(), icon: "handbag.fill", badge: true),
  ]
}
