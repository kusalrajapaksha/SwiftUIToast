//
//  ToastModifier.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import Foundation
import SwiftUI

struct ToastModifier: ViewModifier {
  
  @Binding var toast: Toast?
  @State private var workItem: DispatchWorkItem?
    var yOffset: CGFloat
  
  func body(content: Content) -> some View {
    content
      .overlay(
        ZStack {
          mainToastView()
            .offset(y: yOffset)
        }.animation(.spring(), value: toast)
      )
      .onChange(of: toast) { value in
        showToast()
      }
  }
  
  @ViewBuilder func mainToastView() -> some View {
    if let toast = toast {
      VStack {
          ToastView(style: toast.style, message: toast.message, width: toast.width, cornerRadius: toast.cornerRadius, fontName: toast.fontName, fontSize: toast.fontSize, numberOfLines: toast.numberOfLines, maskedCorners: toast.maskedCorners, horizontalPadding: toast.horizontalPadding, verticalPadding: toast.verticalPadding)
        Spacer()
      }
  
      .transition(AnyTransition.opacity.animation(.linear))
      
    }
  }
  
  private func showToast() {
    guard var toast = toast else { return }
    
    UIImpactFeedbackGenerator(style: .light)
      .impactOccurred()
    
    if toast.duration > 0 {
      workItem?.cancel()
      
      let task = DispatchWorkItem {
        dismissToast()
      }
      
      workItem = task        
      DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
    }
  }
  
  private func dismissToast() {
    withAnimation {
      toast = nil
    }
    
    workItem?.cancel()
    workItem = nil
  }
}
