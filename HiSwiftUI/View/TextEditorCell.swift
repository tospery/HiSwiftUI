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
    
    //@FocusState private var isFocused: Bool
    
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
            
//            FocusableTextEditor(text: $text, isFocused: $isFocused)
//                         .frame(height: 150)
//                         .padding(8)
//                         .background(Color(UIColor.systemGray6))
//                         .cornerRadius(8)
            FocusableTextEditor(
                text: $text,
                focused: $focused,
                characterLimit: characterLimit
            )
                .frame(maxWidth: .infinity)
                .frame(height: 140)
            
//            TextEditor(text: $text)
//                .font(.system(size: 15))
//                .frame(maxWidth: .infinity)
//                .frame(height: 140)
//                .autocorrectionDisabled()
//                .textInputAutocapitalization(.never)
//                .keyboardType(keyboardType)
            
            
//            TextField(placeholder, text: $text)
//                .font(.system(size: 15))
//                .frame(maxWidth: .infinity)
//                .frame(height: 200)
//                // .lineLimit(5)
//                .autocorrectionDisabled()
//                .textInputAutocapitalization(.never)
//                .focused($isFocused)
//                .keyboardType(keyboardType)
//                .onChange(of: isFocused) { newValue in
//                    focused = newValue
//                }
//                .onChange(of: focused) { newValue in
//                    isFocused = newValue
//                }
//                .onChange(of: text) { newValue in
//                    if let limit = characterLimit, newValue.count > limit {
//                        text = String(newValue.prefix(limit))
//                    }
//                }
//                .onAppear {
//                    isFocused = focused
//                }
        }
        .listRowSeparator(.hidden, edges: .all)
    }
    
}
