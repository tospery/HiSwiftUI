//
//  String+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import SwiftUI
import SwifterSwift
import SwiftUIKit_Hi

public extension String {
    
    var apiURLString: String? {
        if self.hasPrefix(UIApplication.shared.baseApiUrl) {
            return self
        }
        let app = "\(UIApplication.shared.appScheme)://"
        let web = "\(UIApplication.shared.baseWebUrl)/"
        var ret = self.removingPrefix(app)
        ret = ret.removingPrefix(web)
        return "\(UIApplication.shared.baseApiUrl)/\(ret)"
    }
    
    var webURLString: String? {
        if self.hasPrefix(UIApplication.shared.baseWebUrl) {
            return self
        }
        let app = "\(UIApplication.shared.appScheme)://"
        let api = "\(UIApplication.shared.baseApiUrl)/"
        var ret = self.removingPrefix(app)
        ret = ret.removingPrefix(api)
        return "\(UIApplication.shared.baseWebUrl)/\(ret)"
    }
    
    var appURLString: String? {
        if self.hasPrefix("\(UIApplication.shared.appScheme)://") {
            return self
        }
        let web = "\(UIApplication.shared.baseWebUrl)/"
        let api = "\(UIApplication.shared.baseApiUrl)/"
        var ret = self.removingPrefix(web)
        ret = ret.removingPrefix(api)
        return "\(UIApplication.shared.appScheme)://\(ret)"
    }
    
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
    
    var color: Color? { .init(hex: self) }
    
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
