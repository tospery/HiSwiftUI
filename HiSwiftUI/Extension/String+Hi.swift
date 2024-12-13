//
//  String+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import Foundation
import SwifterSwift

public extension String {
    
    var isValidInternalUrl: Bool {
        guard let url = self.url else { return false }
        return url.scheme == UIApplication.shared.appScheme
    }
    
    var isValidExternalUrl: Bool {
        guard let scheme = self.url?.scheme else { return false }
        if scheme == UIApplication.shared.appScheme || scheme == "http" || scheme == "https" {
            return false
        }
        return true
    }
    
    var routeHost: String {
        self.url?.host() ?? ""
    }
    
    var routePath: String {
        guard let path = self.url?.path() else { return "" }
        return path.removingPrefix("/").removingSuffix("/")
    }
    
//    static func deepLink(
//        host: String,
//        path: String? = nil,
//        parameters: [String: String]? = nil
//    ) -> String {
//        var url = "\(UIApplication.shared.urlString)://\(host)".url!
//        if let path = path {
//            url.appendPathComponent(path)
//        }
//        if let parameters = parameters {
//            url.appendQueryParameters(parameters)
//        }
//        return url.absoluteString
//    }
    
}
