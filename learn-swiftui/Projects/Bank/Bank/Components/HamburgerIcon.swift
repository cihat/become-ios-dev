//
//  HamburgerIcon.swift
//  Bank
//
//  Created by Cihat Salik on 1.11.2022.
//

import SwiftUI

struct HamburgerIcon: View {
  var body: some View {
    VStack(spacing: 5) {
      Capsule()
        .fill(Color("ColorPrimary"))
        .frame(width: 30, height: 3)
      Capsule()
        .fill(Color("ColorPrimary"))
        .frame(width: 30, height: 3)
      Capsule()
        .fill(Color("ColorPrimary"))
        .frame(width: 30, height: 3)
    }
  }
}

struct HamburgerIcon_Previews: PreviewProvider {
  static var previews: some View {
    HamburgerIcon()
  }
}
