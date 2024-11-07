//
//  URL+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import Foundation
import HiBase
import SwifterSwift

public extension URL {
    
    static func toastURL(message: String = "", active: Bool = false) -> URL? {
        var components = URLComponents()
        components.scheme = UIApplication.shared.urlScheme
        components.host = Parameter.toast
        components.queryItems = [
            .init(name: Parameter.message, value: message.urlEncoded),
            .init(name: Parameter.active, value: active.string)
        ]
        return components.url
    }
    
}
