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
        if profileService.value?.localization == .english {
            return englishLocalizedString
        }
        return chineseLocalizedString
    }
    
    var apiURLString: String {
        if self.hasPrefix(UIApplication.shared.baseApiUrl) {
            return self
        }
        let app = "\(UIApplication.shared.appScheme)://"
        let web = "\(UIApplication.shared.baseWebUrl)/"
        var ret = self.removingPrefix(app)
        ret = ret.removingPrefix(web)
        return "\(UIApplication.shared.baseApiUrl)/\(ret)"
    }
    
    var webURLString: String {
        if self.hasPrefix(UIApplication.shared.baseWebUrl) {
            return self
        }
        let app = "\(UIApplication.shared.appScheme)://"
        let api = "\(UIApplication.shared.baseApiUrl)/"
        var ret = self.removingPrefix(app)
        ret = ret.removingPrefix(api)
        return "\(UIApplication.shared.baseWebUrl)/\(ret)"
    }
    
    var appURLString: String {
        if self.hasPrefix("\(UIApplication.shared.appScheme)://") {
            return self
        }
        let web = "\(UIApplication.shared.baseWebUrl)/"
        let api = "\(UIApplication.shared.baseApiUrl)/"
        var ret = self.removingPrefix(web)
        ret = ret.removingPrefix(api)
        return "\(UIApplication.shared.appScheme)://\(ret)"
    }
    
    var isValidWebUrl: Bool {
        if self.isValidHttpUrl || self.isValidHttpsUrl {
            return true
        }
        return false
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
    
    var swiftUIColor: Color? { self.uiColor?.swiftUIColor }
    
    
    var swiftUIImage: SwiftUI.Image? { SwiftUI.Image.init(self) }
    
}
