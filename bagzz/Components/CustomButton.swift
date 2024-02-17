//
//  CustomButton.swift
//  bagzz
//
//  Created by Dulranga Dhawanitha on 2024-02-16.
//

import SwiftUI

struct CustomButton: View {
  var label: String
  var variant: ButtonVariants = .primary
  var isWideButton = false
  var action: () -> Void

  var body: some View {
    Button(action: action) {
      Label(
        title: {
          Text(label)
            .textCase(.uppercase)
            .tracking(1.0)

        }, icon: {}
      )
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 12)
    .frame(maxWidth: isWideButton ? .infinity : nil)
    .border(.primary)
    .background(variant == .primary ? .font : .background)
    .foregroundStyle(variant == .primary ? .background : .font)
  }
}

enum ButtonVariants {
  case primary
  case secondary
}

#Preview("Primary") {
  CustomButton(label: "Check all latest", variant: .primary) {}
}

#Preview("Secondary") {
  CustomButton(label: "Check all latest", variant: .secondary) {}
}
