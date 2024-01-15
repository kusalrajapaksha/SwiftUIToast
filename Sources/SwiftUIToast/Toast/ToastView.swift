//
//  ToastView.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import SwiftUI

enum CornerMasks{
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

struct ToastView: View {
    var style: ToastStyle
    var message: String = "Undo"
    
    var width:CGFloat = CGFloat.infinity
    var cornerRadius: CGFloat = 8
    
    var fontName: String = ""
    var fontSize: CGFloat = 11
    var numberOfLines: Int = 1
    
    var maskedCorners: [CornerMasks]? = nil
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 6
    
    var topLeftCornerRadius: CGFloat = 0
    var topRightCornerRadius: CGFloat = 0
    var bottomLeftCornerRadius: CGFloat = 0
    var bottomRightCornerRadius: CGFloat = 0
    
    
    init(style: ToastStyle, message: String, width: CGFloat = CGFloat.infinity, cornerRadius: CGFloat = 8, fontName: String = "", fontSize: CGFloat = 11, numberOfLines: Int = 1, maskedCorners: [CornerMasks]? = nil, horizontalPadding: CGFloat = 8, verticalPadding: CGFloat = 8) {
        self.style = style
        self.message = message
        self.width = width
        self.cornerRadius = cornerRadius
        self.fontName = fontName
        self.fontSize = fontSize
        self.numberOfLines = numberOfLines
        self.maskedCorners = maskedCorners
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
       
        self.setCornerRadius()
    }

    mutating func setCornerRadius(){
        self.topLeftCornerRadius = cornerRadius
        self.topRightCornerRadius = cornerRadius
        self.bottomLeftCornerRadius = cornerRadius
        self.bottomRightCornerRadius = cornerRadius
        
        if maskedCorners != nil{
            if maskedCorners!.contains(.topLeft){
                self.topLeftCornerRadius = 0
            }
            
            if maskedCorners!.contains(.topRight){
                self.topRightCornerRadius = 0
            }
            
            if maskedCorners!.contains(.bottomLeft){
                self.bottomLeftCornerRadius = 0
            }
            
            if maskedCorners!.contains(.bottomRight){
                self.bottomRightCornerRadius = 0
            }
        }
    }
    
    var body: some View {
        HStack() {

            Text(message)
                .font(Font.system(size: fontSize))
                .foregroundColor(style.textColor)
                .minimumScaleFactor(0.8)
                .lineLimit(numberOfLines)
            
        }
        
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .background(style.themeColor)
        
        .clipShape(
            .rect(
                topLeadingRadius: topLeftCornerRadius,
                bottomLeadingRadius: bottomLeftCornerRadius,
                bottomTrailingRadius: bottomRightCornerRadius,
                topTrailingRadius: topRightCornerRadius
            )
        )
        
    }
}

#Preview {
    ToastView(style: .info, message: "This is a sample toast",width: 100, maskedCorners: [.topLeft, .topRight],horizontalPadding: 16, verticalPadding: 6)
    
}
