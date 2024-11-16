//
//  HiLink.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/14.
//

import Foundation
import SwifterSwift

/// 导航的分类
public enum JumpType: Int {
    /// 前进
    case forward
    /// 后退
    case back
}

/// 前进的分类 -> HiUIKit://[host]?forwardType=0
public enum ForwardType: Int {
    /// 推进
    case push
    /// 展示
    case present
    /// 打开
    case open
}

/// 后退的分类 -> HiUIKit://back?backType=0
public enum BackType: Int {
    /// 自动
    case auto
    /// 弹出（一个）
    case popOne
    /// 弹出（所有）
    case popAll
    /// 退场
    case dismiss
}

/// 打开的分类 -> HiUIKit://[popup|sheet|alert|toast]/[path]
public enum OpenType: Int {
    /// 消息框（自动关闭）
    case toast
    /// 提示框（可选择的）
    case alert
    /// 表单框（可操作的）
    case sheet
    /// 弹窗
    case popup
    /// 登录（因为登录页通常需要自定义，故以打开方式处理）
    case login
    /// 首页
    case home
    
    static let allHosts = [
        HiNav.Host.toast,
        HiNav.Host.alert,
        HiNav.Host.sheet,
        HiNav.Host.popup,
        HiNav.Host.login,
        HiNav.Host.home
    ]
}

public enum HiNavError: Error {
    case navigation
}

public protocol HiNavCompatible {
    
    // deep-link
    func isLegalHost(host: HiNav.Host) -> Bool
    func allowedPaths(host: HiNav.Host) -> [HiNav.Path]
    
    // user-login
    func needLogin(host: HiNav.Host, path: HiNav.Path?) -> Bool
    
}

final public class HiNav {
    
    public typealias Host = String
    public typealias Path = String
    
    public var isLogined = false
    public static var shared = HiNav()
    
    public func urlScheme(host: Host, path: Path? = nil, parameters: [String: String]? = nil) -> String {
        var url = "\(UIApplication.shared.appScheme)://\(host)".url!
        if let path = path {
            url.appendPathComponent(path)
        }
        if let parameters = parameters {
            url.appendQueryParameters(parameters)
        }
        return url.absoluteString
    }
    
}

extension HiNav.Host {
    /// 返回上一级（包括退回或者关闭）
    public static var back: HiNav.Host { "back" }
    /// 弹窗分为两类（自动关闭的toast和手动关闭的）
    public static var toast: HiNav.Host { "toast" }
    public static var alert: HiNav.Host { "alert" }
    public static var sheet: HiNav.Host { "sheet" }
    public static var popup: HiNav.Host { "popup" }
    
    public static var dashboard: HiNav.Host { "dashboard" }
    public static var personal: HiNav.Host { "personal" }
    
    public static var home: HiNav.Host { "home" }
    public static var login: HiNav.Host { "login" }
}

extension HiNav.Path {
    public static var page: HiNav.Path { "page" }
    public static var list: HiNav.Path { "list" }
    public static var detail: HiNav.Path { "detail" }
    public static var history: HiNav.Path { "history" }
}
