//
//  Color+Hi.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import SwifterSwift
import UIKit

public extension Color {
    public var uiColor: UIColor { .init(self) }
    
    var hexString: String { uiColor.hexString }
    
    static var inversePrimary: Color {
        (profileService.value?.isDark ?? false) ? .black : .white
        // .white
    }
    
    static var surface: Color {
        (profileService.value?.isDark ?? false) ? .black.opacity(0.7) : .init(hex: 0xF4F4F4)
        // .init(hex: 0xF4F4F4)
    }
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
