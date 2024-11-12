//
//  View+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/11.
//

import SwiftUI

extension View {
    
    public static var className: String {
        String(describing: type(of: self))
    }
    
    public var className: String {
        String(describing: type(of: self))
    }
    
}
