//
//  Separator.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/15.
//

import SwiftUI
import SwiftUIKit_Hi
import HiCore

public struct Separator: View {
    
    public init() { }
    
    public var body: some View {
        Rectangle()
            .fill(Color.init(hex: 0xDCDCDC))
            .frame(height: pixelOne)
    }
    
}
