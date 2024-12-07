//
//  SimpleHeaderIdleView.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/3.
//

import SwiftUI

public struct SimpleHeaderIdleView: View {
    
    let progress: CGFloat
    
    public init(_ progress: CGFloat) {
        self.progress = progress
    }
    
    public var body: some View {
        VStack {
            if progress >= 1.5 {
                Text("Header.Pulling.Text")
                    .font(.callout)
                    .foregroundStyle(Color.primary)
            } else {
                Text("Header.Idle.Text")
                    .font(.callout)
                    .foregroundStyle(Color.primary)
            }
        }
        .frame(height: 32)
    }
    
}
