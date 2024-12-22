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
        if profileService.value?.localization == .chinese {
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
        guard self.hasPrefix(UIApplication.shared.baseWebUrl) else { return false }
        return true
    }
    
    var isValidAppUrl: Bool { !isValidWebUrl }
    
    var isValidInternalAppUrl: Bool {
        guard isValidAppUrl else { return false }
        return self.url?.scheme == UIApplication.shared.appScheme
    }
    
    var routeHost: String {
        if self.isValidInternalAppUrl {
            return self.url?.host() ?? ""
        }
        if self.isValidInternalWebUrl {
            var string = self.removingPrefix(UIApplication.shared.baseWebUrl)
            string = "\(UIApplication.shared.appScheme)://\(string)"
            return string.url?.host() ?? ""
        }
        return ""
    }
    
    var routePath: String {
        if self.isValidInternalAppUrl {
            guard let path = self.url?.path() else { return "" }
            return path.removingPrefix("/").removingSuffix("/")
        }
        if self.isValidInternalWebUrl {
            var string = self.removingPrefix(UIApplication.shared.baseWebUrl)
            string = "\(UIApplication.shared.appScheme)://\(string)"
            guard let path = string.url?.path() else { return "" }
            return path.removingPrefix("/").removingSuffix("/")
        }
        return ""
    }
    
}
