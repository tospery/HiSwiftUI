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
    }
    
}
