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
                    Text((model.title ?? "").localizedStringKey)
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                    Spacer()
                }
                .frame(height: 40)
                .background(Color.background)
            }
        } else {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 20)
                Button {
                    if model.enabled ?? false {
                        action()
                    }
                } label: {
                    Text((model.title ?? "").localizedStringKey)
                        .font(.headline)
                        .foregroundStyle(
                            (model.enabled ?? false)
                            ? Color.background
                            : Color.background.opacity(0.7)
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 44)
                        .background(
                            (model.enabled ?? false)
                            ? Color.accentColor
                            : Color.accentColor.opacity(0.7)
                        )
                        .clipShape(.rect(cornerRadius: 10))
                }
                .buttonStyle(.plain)
                Spacer()
                    .frame(width: 20)
            }
            .padding(.vertical, 0)
        }
    }
}
