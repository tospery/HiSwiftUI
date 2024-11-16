//
//  UIApplication+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import UIKit

public extension UIApplication {
    
    var appScheme: String { self.appScheme(name: "app") ?? "" }
    
    var linkDomains: [String] { Bundle.main.infoDictionary?["linkDomains"] as? [String] ?? [] }
    
    @objc var baseApiUrl: String {
        var domain = self.linkDomains.first ?? ""
        if domain.isEmpty {
            domain = "\(self.appScheme).com"
        }
        return "https://\(domain)"
    }
    
    @objc var baseWebUrl: String {
        var domain = self.linkDomains.first ?? ""
        if domain.isEmpty {
            domain = "\(self.appScheme).com"
        }
        return "https://\(domain)"
    }
    
    func appScheme(name: String) -> String? {
        var scheme: String? = nil
        if let types = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? Array<Dictionary<String, Any>> {
            for info in types {
                if let urlName = info["CFBundleURLName"] as? String,
                   urlName == name {
                    if let urlSchemes = info["CFBundleURLSchemes"] as? [String] {
                        scheme = urlSchemes.first
                    }
                }
            }
        }
        return scheme
    }
    
    public var myKeyWindow: UIWindow {
        if let window1 = self.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.first {
            return window1
        }
        if let window2 = self.windows.filter { $0.isKeyWindow }.first {
            return window2
        }
        return .init()
    }
    
}
