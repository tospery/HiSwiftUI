//
//  TileCell.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/17.
//

import SwiftUI
import SwiftUIKit_Hi
import HiResource
import HiCore
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
                Rectangle()
                    .fill(model.color?.color ?? Color.clear)
                    .frame(maxWidth: .infinity)
                    .frame(height: model.height ?? 12)
            } else {
                Button {
                    action?()
                } label: {
                    VStack(spacing: 0) {
                        Spacer()
                        HStack {
                            // icon
                            if model.icon?.isEmpty ?? true {
                                EmptyView()
                            } else {
                                if model.icon!.hasSuffix("_icon"), let uiImage = UIImage(named: model.icon!) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(.leading)
                                } else {
                                    EmptyView()
                                }
                            }
                            // title
                            if model.title?.isEmpty ?? true {
                                EmptyView()
                            } else {
                                text()
                                    .font(.system(size: 15))
                                    .foregroundStyle(Color.primary.opacity(0.8))
                            }
                            Spacer()
                            // detail
                            if model.detail?.isEmpty ?? true {
                                EmptyView()
                            } else {
                                Text(model.detail!)
                                    .font(.system(size: 13))
                                    .foregroundStyle(Color.gray)
                            }
                            // indicator
                            if !(model.indicated ?? false) {
                                EmptyView()
                            } else {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.accentColor)
                                    .padding(.trailing)
                            }
                            // checked
                            if !(model.checked ?? false) {
                                EmptyView()
                            } else {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.accentColor)
                                    .padding(.trailing)
                            }
                        }
                        Spacer()
                        if model.separated ?? false {
                            Divider()
                                .frame(height: pixelOne)
                                .background(Color.gray.opacity(0.02))
                                .padding(.leading)
                        } else {
                            EmptyView()
                        }
                    }
                }
                .frame(height: 44)
                .background(Color.background)
            }
        }
    }
    
    func text() -> Text {
        let string = model.title ?? ""
        if model.autoLinked ?? false {
            return Text(LocalizedStringKey(string))
        }
        let resource = LocalizedStringResource.init(stringLiteral: string)
        var text = AttributedString.init(localized: resource)
        text.font = .systemFont(ofSize: 15)
        text.foregroundColor = .primary.opacity(0.8)
        text.link = nil
        return Text(text)
    }
    
}
