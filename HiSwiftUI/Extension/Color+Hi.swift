//
//  Color+Hi.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import UIKit
import SwiftUI
import SwifterSwift

public extension Color {
    public var uiColor: UIColor { .init(self) }
    
    var hexString: String { uiColor.hexString }
    
    static var inversePrimary: Color {
        .init(uiColor: .init(dynamicProvider: { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .black : .white
        }))
    }
    
    static var surface: Color {
        .init(uiColor: .init(dynamicProvider: { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? .init(hex: 0x191919) : .init(hex: 0xF4F4F4)
        }))
    }
}
