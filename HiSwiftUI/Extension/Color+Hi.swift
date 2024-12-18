//
//  Color+Hi.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import SwifterSwift
import UIKit

/// 客户化的颜色采用opacity方法来实现
public extension Color {
    public var uiColor: UIColor { .init(self) }
    
    static var separator: Color { UIColor.separator.swiftUIColor }
    static var placeholder: Color { UIColor.placeholderText.swiftUIColor }
    static var surface: Color { UIColor.quaternarySystemFill.swiftUIColor }
    static var container: Color { UIColor.systemFill.swiftUIColor }
    static var background: Color { UIColor.systemBackground.swiftUIColor }
    
    var hexString: String { uiColor.hexString }
}

public extension UIColor {
    
    public var swiftUIColor: SwiftUI.Color {
        SwiftUI.Color(uiColor: self)
    }
    
    var argbHexString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        let a = Int(alpha * 255)
        return String(format: "#%02X%02X%02X%02X", r, g, b, a)
    }

}
