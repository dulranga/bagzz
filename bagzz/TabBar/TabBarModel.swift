//
//  TabBarModel.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-15.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
  let id = UUID()
  let name: String
  let content: any View
  let icon: String
  var badge: Bool = false
}
