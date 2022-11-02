//
//  NavigationView.swift
//  Bank
//
//  Created by Cihat Salik on 1.11.2022.
//

import SwiftUI

struct NavigationView: View {
  var body: some View {
    VStack {
      HStack(spacing: 10) {
        HamburgerIcon()
        Spacer()
        
        Image(systemName: "bell")
          .foregroundColor(Color("ColorYellow"))
        Image(systemName: "text.bubble")
          .foregroundColor(Color("ColorPrimary"))
      }
      .font(.title)
      .padding(.horizontal, 20)
      .padding(.vertical, 5)
      .overlay {
        Text("Bank App")
          .bold(true)
          .font(.title3)
      }
      HStack(spacing: 0) {
        Color("Color1")
          .frame(minWidth: 0, maxWidth: .infinity)
        Color("Color2")
          .frame(minWidth: 0, maxWidth: .infinity)
        Color("Color3")
          .frame(minWidth: 0, maxWidth: .infinity)
        Color("Color4")
          .frame(minWidth: 0, maxWidth: .infinity)
      }
      .frame(height: 4)
    }
    .padding(.top, CGFloat(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0))
  }
}

struct NavigationView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView()
      .previewLayout(.sizeThatFits)
  }
}
