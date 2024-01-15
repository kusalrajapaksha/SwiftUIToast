//
//  ToastStyle.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import Foundation
import SwiftUI

public enum ToastStyle {
    case info
    case secondary
    case success
    case danger
    case warning
}

public extension ToastStyle {
  var themeColor: Color {
      switch self {
      case .info:
          return Color(hex: "#333333")
      case .secondary:
          return Color(hex: "#666666")
      case .success:
          return Color(hex: "#28a745")
      case .danger:
          return Color(hex: "#DC3545")
      case .warning:
          return Color(hex: "#ffc107")
      }
  }

  var textColor: Color {
      switch self {
      case .info:
          return Color(hex: "#FFFFFF")
      case .secondary:
          return Color.white
      case .success:
          return Color.white
      case .danger:
          return Color.white
      case .warning:
          return Color(hex: "#343a40")
      }
  }
}

