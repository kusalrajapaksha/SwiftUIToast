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
    
    var fontSize: CGFloat = 11
    var numberOfLines: Int = 1
    
    var maskedCorners: [CornerMasks]? = nil
    var horizontalPadding: CGFloat = 8
    var verticalPadding: CGFloat = 8
    
    public init(style: ToastStyle, message: String, duration: Double = 1, width: Double = .infinity, cornerRadius: CGFloat = 8, fontSize: CGFloat = 11, numberOfLines: Int = 1, maskedCorners: [CornerMasks]? = nil, horizontalPadding: CGFloat = 8, verticalPadding: CGFloat = 8) {
        self.style = style
        self.message = message
        self.duration = duration
        self.width = width
        self.cornerRadius = cornerRadius
        self.fontSize = fontSize
        self.numberOfLines = numberOfLines
        self.maskedCorners = maskedCorners
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
}
