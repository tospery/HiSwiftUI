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
    
    init(_ model: ButtonModel, action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(model.title ?? "")
                .font(.system(size: 16))
                .foregroundStyle(Color.accentColor)
        }
        .listRowSeparator(.hidden, edges: .all)
    }
    
}
