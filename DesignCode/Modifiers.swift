//
//  Modifiers.swift
//  DesignCode
//
//  Created by Nafish on 12/11/24.
//

import SwiftUI

struct ShowModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x:0, y:12)
            .shadow(color: Color.black.opacity(0.1), radius: 20, x:0, y:1)
    }
}
struct FontModifier: ViewModifier{
    var style: Font.TextStyle = .body
    func body(content: Content) -> some View {
        content
            .font(.system(style,design: .default))
    }
}

struct CustomFontModifier: ViewModifier{
    var size: CGFloat = 28
    func body(content: Content) -> some View {
        content.font(.custom("WorkSans-Bold", size: size))
    }
}
