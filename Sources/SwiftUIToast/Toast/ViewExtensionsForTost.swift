//
//  ViewExtensionsForTost.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import Foundation
import SwiftUI

public extension View {
    func toastView(toast: Binding<Toast?>, yOffset: CGFloat = 0) -> some View {
        self.modifier(ToastModifier(toast: toast, yOffset: yOffset))
  }
    
}

extension View {
  func glow(color: Color = .gray, radius: CGFloat = 20) -> some View {
    self
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
      .shadow(color: color, radius: radius / 3)
  }
}

