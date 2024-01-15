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
    
    public init(style: ToastStyle, message: String, duration: Double, width: Double, cornerRadius: CGFloat, fontName: String, fontSize: CGFloat, numberOfLines: Int, maskedCorners: [CornerMasks]? = nil, horizontalPadding: CGFloat, verticalPadding: CGFloat) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
        self.cornerRadius = cornerRadius
        self.fontName = fontName
        self.fontSize = fontSize
        self.numberOfLines = numberOfLines
        self.maskedCorners = maskedCorners
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
}
