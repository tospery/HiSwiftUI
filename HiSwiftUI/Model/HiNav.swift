//
//  HiLink.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/14.
//

import Foundation
import SwifterSwift

/// 导航的设计
/// target分为两类，一个是通用链接（urlString，来自网页），另一个是深度链接（deepLink，来自应用）
/// 通用链接和深度链接没有语义上的关联性，而需要进行转换，可以通过添加自定义的fromWeb参数来区分，深度链接的生产是来源于app还是web
/// 对于deepLink，只采用host的设计方式，不需要path，以便进行简化。

/// 导航的分类
public enum JumpType: Int {
    /// 前进
    case forward
    /// 后退
    case back
}

/// 前进的分类 -> HiSwiftUI://[host]?forwardType=0
public enum ForwardType: Int {
    /// 推进
    case push
    /// 展示
    case present
    /// 打开
    case open
}

/// 后退的分类 -> HiSwiftUI://back?backType=0
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

/// 打开的分类 -> HiSwiftUI://[popup|sheet|alert|toast]/[path]
public enum OpenType: Int {
    /// 消息框（自动关闭）
    case toast
    /// 提示框（可选择的）
    case alert
    /// 表单框（可操作的）
    case sheet
    /// 弹窗
    case popup
//    /// 登录（因为登录页通常需要自定义，故以打开方式处理）
//    case login
//    /// 首页
//    case home
    case logic
    
    static let allHosts = [
        HiNav.Host.toast,
        HiNav.Host.alert,
        HiNav.Host.sheet,
        HiNav.Host.popup,
        HiNav.Host.logic
    ]
}

public enum HiNavError: Error {
    case navigation
}

public protocol HiNavCompatible {
    
    // 合法的外部跳转
    func isLegalHost(host: HiNav.Host) -> Bool
    func allowedPaths(host: HiNav.Host) -> [HiNav.Path]
    
    // user-login
    func isLogined() -> Bool
    func needLogin(host: HiNav.Host, path: HiNav.Path?) -> Bool
    
    // parse
    func resolution(_ target: String) -> Any?
}

final public class HiNav {
    
    public typealias Host = String
    public typealias Path = String
    
    public static var shared = HiNav()
    
    public func deepLink(host: Host, path: Path? = nil, parameters: [String: String]? = nil) -> String {
        var url = "\(UIApplication.shared.urlScheme)://\(host)".url!
        if let path = path {
            url.appendPathComponent(path)
        }
        if let parameters = parameters {
            url.appendQueryParameters(parameters)
        }
        return url.absoluteString.removingSuffix("?")
    }
    
    public func parse(_ target: String) -> Any? {
        if let compatible = self as? HiNavCompatible {
            return compatible.resolution(target)
        }
        return nil
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
    public static var logic: HiNav.Host { "logic" }
    
    public static var dashboard: HiNav.Host { "dashboard" }
    public static var personal: HiNav.Host { "personal" }
    
    public static var login: HiNav.Host { "login" }
    public static var web: HiNav.Host { "web" }
}

extension HiNav.Path {
    
}
