//
//  TextEditorCell.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/18.
//

import SwiftUI
import Combine
import HiResource
import HiSwiftUI

public struct TextEditorCell: View {
    
    @Binding var text: String
    @Binding var focused: Bool
    var placeholder: String
    var keyboardType: UIKeyboardType
    var characterLimit: Int?
    
    public init(
        text: Binding<String>,
        focused: Binding<Bool> = .constant(false),
        placeholder: String = "",
        keyboardType: UIKeyboardType = .default,
        characterLimit: Int? = nil
    ) {
        _text = text
        _focused = focused
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.characterLimit = characterLimit
    }
    
    public var body: some View {
        VStack {
            FocusableTextEditor(
                text: $text,
                focused: $focused,
                placeholder: placeholder,
                keyboardType: keyboardType,
                characterLimit: characterLimit
            )
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .onChange(of: text) { newValue in
                    if let limit = characterLimit, newValue.count > limit {
                        text = String(newValue.prefix(limit))
                    }
                }
            if let limit = characterLimit {
                HStack {
                    Spacer()
                    Text("\(text.count)/\(limit)")
                        .font(.system(size: 12))
                        .foregroundStyle(Color.body)
                }
            } else {
                EmptyView()
            }
        }
        .listRowSeparator(.hidden, edges: .all)
    }
    
}
