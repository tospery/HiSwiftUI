//
//  Color+Hi.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import UIKit

public extension Color {
    
    public var uiColor: UIColor {
        .init(self)
    }
    
    static var accent: Color { .accentColor }
    
    static var background: Color { .white }
    static var foreground: Color { .primary }
    
    static var surface: Color { Color.init(uiColor: .init(hex: 0xF4F4F4)!) }
    static var container: Color { Color.init(uiColor: .init(hex: 0xD1D1D1)!) }
    
    static var separator: Color { Color.init(uiColor: .init(hex: 0xE0E0E0)!) }
    static var indicator: Color { Color.init(uiColor: .init(hex: 0xE0E0E0)!) }
    
    static var title: Color { Color.init(uiColor: .init(hex: 0x333333)!) }
    static var headline: Color { Color.init(uiColor: .init(hex: 0x666666)!) }
    static var body: Color { Color.init(uiColor: .init(hex: 0x888888)!) }
    static var footnote: Color { Color.init(uiColor: .init(hex: 0xD2D2D2)!) }
    static var caption: Color { Color.init(uiColor: .init(hex: 0xB2B2B2)!) }
}

public extension UIColor {
    
    public var swiftUIColor: SwiftUI.Color {
        SwiftUI.Color(uiColor: self)
    }
    
}
