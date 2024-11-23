//
//  Color+Hi.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import UIKit

/// 客户化的颜色采用opacity方法来实现
public extension Color {
    public var uiColor: UIColor { .init(self) }
    
    static var separator: Color { UIColor.separator.swiftUIColor }
    static var placeholder: Color { UIColor.placeholderText.swiftUIColor }
    static var surface: Color { UIColor.quaternarySystemFill.swiftUIColor }
    static var container: Color { UIColor.systemFill.swiftUIColor }
    static var background: Color { UIColor.systemBackground.swiftUIColor }
}

public extension UIColor {
    
    public var swiftUIColor: SwiftUI.Color {
        SwiftUI.Color(uiColor: self)
    }
    
}
