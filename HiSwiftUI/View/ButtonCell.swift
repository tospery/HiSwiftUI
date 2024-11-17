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
                    Spacer()
                        .frame(width: 50)
                        .onTapGesture {
                        }
                    Button(action: action) {
                        Text((model.title ?? "").localizedStringKey)
                            .font(.system(size: 17))
                            .foregroundStyle(Color.background)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                            .background(Color.accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    .contentShape(Rectangle())
                    Spacer()
                        .frame(width: 50)
                        .onTapGesture {
                        }
                }
                .listRowInsets(.zero)
                .listRowSeparator(.hidden, edges: .all)
                .background(Color.green)
            }
        }
    }
    
}
