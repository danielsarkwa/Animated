//
//  CustomFont.swift
//  Animated
//
//  Created by Daniel Yeboah on 7.6.2023.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    
    // returns a value based on the value passed to the textStyle property which can be any of the possible values of the property
    var name: String {
        switch textStyle {
        case .largeTitle, .title, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 24
        case .title3:
            return 20
        case .body:
            return 17
        case .headline:
            return 17
        case .subheadline:
            return 15
        case .subheadline2:
            return 15
        case .footnote:
            return 13
        case .footnote2:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 12
        }
    }
    
    // relativeTo uses the same accessbility ratio of iOS dynamic types
    var relative: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .headline:
            return .headline
        case .subheadline:
            return .subheadline
        case .subheadline2:
            return .subheadline
        case .footnote:
            return .footnote
        case .footnote2:
            return .footnote
        case .caption:
            return .caption
        case .caption2:
            return .caption
        }
    }
    
    func body(content: Content) -> some View {
        content.font(
            .custom(name, size: size, relativeTo: relative)
        )
    }
}

extension View {
    func customFont(_ textStyle: TextStyle) -> some View {
        modifier(CustomFont(textStyle: textStyle))
    }
}

// list of all the possible text styles a font can have
enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case body
    case headline
    case subheadline
    case subheadline2
    case footnote
    case footnote2
    case caption
    case caption2
}
