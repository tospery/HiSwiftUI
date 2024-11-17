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
    
    @State private var isPressed: Bool = false
    
    public init(_ model: ButtonModel, action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }
    
    public var body: some View {
        Group {
            if model.style == .plain {
                Button(action: action) {
                    HStack {
                        Spacer()
                        Text((model.title ?? "").localizedStringKey)
                            .font(.system(size: 17))
                            .foregroundStyle(Color.accentColor)
                        Spacer()
                    }
                    .padding(.vertical, 2)
                }
                .listRowSeparator(.hidden, edges: .all)
            } else {
                HStack(spacing: 0) {
                    Text((model.title ?? "").localizedStringKey)
                        .font(.system(size: 17))
                        .foregroundStyle(Color.background)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(isPressed ? Color.red.opacity(0.7) : Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    if !isPressed {
                                        withAnimation(.easeInOut(duration: 0.1)) {
                                            isPressed = true
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(.easeInOut(duration: 0.1)) {
                                        isPressed = false
                                    }
                                    action()
                                }
                        )
                        .padding(.horizontal, 20)
                }
                .listRowInsets(.zero)
                .listRowSeparator(.hidden, edges: .all)
                .background(Color.surface)
                .padding(.vertical, 0)
            }
        }
    }
    
}
