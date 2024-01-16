//
//  ToastView.swift
//  AI Photo Editor
//
//  Created by Kusal Rajapaksha on 2023-11-25.
//

import SwiftUI

public enum CornerMasks{
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

public struct ToastView: View {
    var style: ToastStyle
    var message: String = "Undo"
    
    var width:CGFloat = CGFloat.infinity
    var cornerRadius: CGFloat = 8
    
    var fontSize: CGFloat = 11
    var numberOfLines: Int = 1
    
    var maskedCorners: [CornerMasks]? = nil
    var horizontalPadding: CGFloat = 8
    var verticalPadding: CGFloat = 8
    
    var topLeftCornerRadius: CGFloat = 0
    var topRightCornerRadius: CGFloat = 0
    var bottomLeftCornerRadius: CGFloat = 0
    var bottomRightCornerRadius: CGFloat = 0
    
    
    init(style: ToastStyle, message: String, width: CGFloat = CGFloat.infinity, cornerRadius: CGFloat = 8, fontSize: CGFloat = 11, numberOfLines: Int = 1, maskedCorners: [CornerMasks]? = nil, horizontalPadding: CGFloat = 8, verticalPadding: CGFloat = 8) {
        self.style = style
        self.message = message
        self.width = width
        self.cornerRadius = cornerRadius
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
    
    public var body: some View {
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
    VStack{
        ToastView(style: .info, message: "This is a info toast",width: 100,horizontalPadding: 16, verticalPadding: 6)
        ToastView(style: .success, message: "This is a success toast",width: 100,horizontalPadding: 16, verticalPadding: 6)
        ToastView(style: .warning, message: "This is a warning toast",width: 100,horizontalPadding: 16, verticalPadding: 6)
        ToastView(style: .danger, message: "This is a danger toast",width: 100,horizontalPadding: 16, verticalPadding: 6)
        ToastView(style: .secondary, message: "This is a secondary toast",width: 100,horizontalPadding: 16, verticalPadding: 6)
    }
    
    
}
