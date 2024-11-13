//
//  ErrorView.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import HiCore

public struct ErrorView: View {
    private let error: Error
    private let action: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme

    public init(error: Error, action: (() -> Void)? = nil) {
        self.error = error
        self.action = action
    }

    public var body: some View {
        Button {
            action?()
        } label: {
            VStack {
                error.asHiError.displayImage!
                    .padding(.bottom, 5)
                Text(error.asHiError.failureReason ?? "")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.foreground)
                    .font(.title3)
                    .padding(.bottom, 5)
                Text(error.asHiError.errorDescription ?? "")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.footnote)
                    .font(.body)
            }
             .frame(maxWidth: .infinity, maxHeight: .infinity)
             .contentShape(.rect)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
