//
//  ContentView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-15.
//

import SwiftUI

struct ContentView: View {
  @StateObject var cart = Cart()

  var body: some View {
    VStack {
      HeaderView()
      TabBarView()
    }
    .environmentObject(cart)
  }
}

struct ContentView_Previews: PreviewProvider {
  static let cart = Cart()

  static var previews: some View {
    ContentView().environmentObject(cart)
  }
}
