//
//  TileCell.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/17.
//

import SwiftUI
import HiResource
import HiSwiftUI

public struct TileCell: View {

    let model: Tile
    let action: (() -> Void)?
    
    public init(_ model: Tile) {
        self.model = model
        self.action = nil
    }
    
    public init(_ model: Tile, action: @escaping () -> Void) {
        self.model = model
        self.action = action
    }
    
    public var body: some View {
        Group {
            if model.isSpace {
                Color.surface
                    .frame(maxWidth: .infinity)
                    .frame(height: model.height ?? 12)
                    .listRowSeparator(.hidden, edges: .all)
                    .listRowInsets(.zero)
            } else {
                Button {
                    action?()
                } label: {
                    HStack {
                        // icon
                        if model.icon?.isEmpty ?? true {
                            EmptyView()
                        } else {
                            if model.icon!.hasSuffix("_icon"), let uiImage = UIImage(named: model.icon!) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            } else {
                                EmptyView()
                            }
                        }
                        // title
                        if model.title?.isEmpty ?? true {
                            EmptyView()
                        } else {
                            Text(model.title!.localizedStringKey)
                                .font(.system(size: 15))
                                .foregroundStyle(Color.primary.opacity(0.8))
                        }
                        Spacer()
                        // detail
                        if model.detail?.isEmpty ?? true {
                            EmptyView()
                        } else {
                            Text(model.detail!)
                                .font(.system(size: 14))
                                .foregroundStyle(Color.primary.opacity(0.8))
                        }
                        // indicator
                        if !(model.indicated ?? false) {
                            EmptyView()
                        } else {
                            Image(systemName: "chevron.right")
//                            Image(uiImage: .indicator)
//                                .renderingMode(.template)
                                .font(.system(size: 14))
                                .foregroundStyle(Color.accentColor)
                        }
                        // checked
                        if !(model.checked ?? false) {
                            EmptyView()
                        } else {
                            Image(systemName: "checkmark")
                            // Image(uiImage: .checked)
                                .font(.system(size: 14))
                                .foregroundStyle(Color.accentColor)
                        }
                    }
                    .padding(.vertical, 2)
                }
                .listRowSeparatorTint(.separator)
                .listRowSeparator(.hidden, edges: model.separated ?? false ? .top : .all)
            }
        }
    }
}
