//
//  TabBarView.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-15.
//

import SwiftUI

struct TabBarView: View {
  @StateObject var vm = TabBarViewModel()

  var body: some View {
    TabView(selection: $vm.selectedName) {
      ForEach(vm.tabs) { tabItem in

        AnyView(tabItem.content)
          .tag(tabItem.name)
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .overlay(alignment: .bottom) {
      TabBarCustomView(vm: vm)
        .padding(.bottom, 10)
    }
  }
}

#Preview {
  TabBarView()
}
