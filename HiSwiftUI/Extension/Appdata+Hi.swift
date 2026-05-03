//
//  Appdata+Hi.swift
//  HiBase
//
//  Created by 杨建祥 on 5/4/26.
//

import Foundation
import SwiftUI
import HiBase
import HiCore

public extension Appdata {
    
    var preferredAccentColor: SwiftUI.Color {
        var color = self.tintColor?.swiftUIColor
        if color == nil {
            color = Color("AccentColor")
        }
        if color == nil {
            color = Color.accentColor
        }
        return color!
    }
    
}

