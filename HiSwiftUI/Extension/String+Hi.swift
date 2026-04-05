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

public extension String {
    
    var localizedString: String {
        if preferenceService.value?.localization == .chinese {
            return chineseLocalizedString
        }
        return englishLocalizedString
    }

    var isValidWebUrl: Bool {
        if self.isValidHttpUrl || self.isValidHttpsUrl {
            return true
        }
        return false
    }
    
    var isValidInternalWebUrl: Bool {
        guard isValidWebUrl else { return false }
        guard let components = self.url?.host()?.components(separatedBy: ".") else { return false }
        if components.count == 2 {
            return components.first?.lowercased() == Bundle.main.urlScheme()
        } else if components.count == 3 {
            return components[1].lowercased() == Bundle.main.urlScheme()
        }
        return false
    }
    
//    var isValidUnivLink: Bool {
//        guard isValidWebUrl else { return false }
////        guard self.hasPrefix(UIApplication.shared.baseUnivLink) else { return false }
//        return true
//    }
    
    var isValidAppUrl: Bool { !isValidWebUrl }
    
    var isValidDeepLink: Bool {
        guard isValidAppUrl else { return false }
        return self.url?.scheme?.lowercased() == UIApplication.shared.urlScheme
    }
    
    var deepLink: String? {
        guard isValidInternalWebUrl else { return nil }
        guard var components = URLComponents(string: self) else { return nil }
        let scheme = Bundle.main.urlScheme() ?? ""
        var path = components.path.removingPrefix("/").removingSuffix("/").components(separatedBy: "/").joined(separator: "/")
        let query = components.percentEncodedQuery.map { "?\($0)" } ?? ""
        return "\(scheme)://\(path)\(query)"
    }
    
    var routeHost: String {
        if self.isValidDeepLink {
            return self.url?.host() ?? ""
        }
        if self.isValidInternalWebUrl {
            guard let components = self.url?.path().removingPrefix("/").removingSuffix("/").components(separatedBy: "/"), components.count != 0 else { return "" }
            return components.first!
        }
        return ""
    }
    
    var routePath: String {
        if self.isValidDeepLink {
            guard let path = self.url?.path() else { return "" }
            return path.removingPrefix("/").removingSuffix("/")
        }
        if self.isValidInternalWebUrl {
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
