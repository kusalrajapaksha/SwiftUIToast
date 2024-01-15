//
//  Toast.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import Foundation

public struct Toast: Equatable{
    var style: ToastStyle
    var message: String
    var duration: Double = 1
    var width: Double = .infinity
    var cornerRadius: CGFloat = 8
    
    var fontName: String = ""
    var fontSize: CGFloat = 11
    var numberOfLines: Int = 1
    
    var maskedCorners: [CornerMasks]? = nil
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 6
}
