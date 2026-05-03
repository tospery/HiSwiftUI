//
//  String+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import SwiftUI
import HiCore
import SwifterSwift
import SwiftUIKit_Hi

// deep link分为app link和custom url scheme
// 即，webDeepLink（） appDeepLink
public extension String {

    var isValidWebUrl: Bool {
        guard let scheme = self.url?.scheme?.lowercased(), scheme.isNotEmpty else { return false }
        return [
            "http", "https"
        ].contains(scheme)
    }
    
    var isValidDeepWebUrl: Bool {
        guard isValidWebUrl else { return false }
        return self.lowercased().hasPrefix(Bundle.main.baseWebUrl.lowercased())
    }
    
    var isValidExternalWebUrl: Bool {
        guard isValidWebUrl else { return false }
        return self.lowercased().hasPrefix("https://apps.apple.com")
    }
    
    var isValidAppUrl: Bool {
        guard let scheme = self.url?.scheme?.lowercased(), scheme.isNotEmpty else { return false }
        return ![
            "http", "https"
        ].contains(scheme)
    }
    
    var isValidDeepAppUrl: Bool {
        guard isValidAppUrl else { return false }
        return self.url?.scheme?.lowercased() == UIApplication.shared.urlScheme
    }
    
    var routeHost: String {
        if self.isValidDeepAppUrl {
            return self.url?.host() ?? ""
        }
        if self.isValidDeepWebUrl {
            guard let components = self.url?.path().removingPrefix("/").removingSuffix("/").components(separatedBy: "/"), components.count != 0 else { return "" }
            return components.first!
        }
        return ""
    }
    
    var routePath: String {
        if self.isValidDeepAppUrl {
            guard let path = self.url?.path() else { return "" }
            return path.removingPrefix("/").removingSuffix("/")
        }
        if self.isValidDeepWebUrl {
            guard let components = self.url?.path().removingPrefix("/").removingSuffix("/").components(separatedBy: "/") else { return "" }
            if components.count <= 1 {
                return ""
            }
            return components.dropFirst().joined(separator: "/")
        }
        return ""
    }
    
    var dictionary: [String: Any] {
        guard let data = self.data(using: .utf8) else { return [:] }
        guard let object = try? data.jsonObject() else { return [:] }
        return object as? [String: Any] ?? [:]
    }
    
}
