//
//  ButtonCell.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/16.
//

import SwiftUI
import HiBase
import HiCore

public struct ButtonCell: View {
    
    let model: ButtonModel
    let action: () -> Void
    
    public init(_ model: ButtonModel, action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }
    
    public var body: some View {
        if model.style == .plain {
            Button(action: action) {
                HStack {
                    Spacer()
                    Text((model.title ?? "").localizedKey)
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                    Spacer()
                }
                .frame(height: 40)
                .background(Color.inversePrimary)
            }
        } else {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 20)
                Button(action: action) {
                    Text((model.title ?? "").localizedKey)
                        .font(.headline)
                        .foregroundStyle(Color.inversePrimary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(Color.accentColor)
                        .clipShape(.rect(cornerRadius: 10))
                }
                .buttonStyle(.plain)
                .disabled(!(model.enabled ?? false))
                Spacer()
                    .frame(width: 20)
            }
            .padding(.vertical, 0)
        }
    }
}
