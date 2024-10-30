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
    
    static var background: Color { .secondary }
    static var foreground: Color { .primary }
    
    static var fg05: Color { .primary.opacity(0.05) }
    static var fg10: Color { .primary.opacity(0.10) }
    static var fg15: Color { .primary.opacity(0.15) }
    static var fg20: Color { .primary.opacity(0.20) }
    static var fg25: Color { .primary.opacity(0.25) }
    static var fg30: Color { .primary.opacity(0.30) }
    static var fg35: Color { .primary.opacity(0.35) }
    static var fg40: Color { .primary.opacity(0.40) }
    static var fg45: Color { .primary.opacity(0.45) }
    static var fg50: Color { .primary.opacity(0.50) }
    static var fg55: Color { .primary.opacity(0.55) }
    static var fg60: Color { .primary.opacity(0.60) }
    static var fg65: Color { .primary.opacity(0.65) }
    static var fg70: Color { .primary.opacity(0.70) }
    static var fg75: Color { .primary.opacity(0.75) }
    static var fg80: Color { .primary.opacity(0.80) }
    static var fg85: Color { .primary.opacity(0.85) }
    static var fg90: Color { .primary.opacity(0.90) }
    static var fg95: Color { .primary.opacity(0.95) }
    
}

public extension UIColor {
    
    public var swiftUIColor: SwiftUI.Color {
        SwiftUI.Color(uiColor: self)
    }
    
}
