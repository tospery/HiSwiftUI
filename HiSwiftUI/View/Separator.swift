//
//  Separator.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/15.
//

import SwiftUI
import HiCore

public struct Separator: View {
    
    public init() { }
    
    public var body: some View {
        Rectangle()
            .fill(Color.separator.opacity(0.4))
            .frame(height: pixelOne)
    }
    
}
