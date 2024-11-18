//
//  HiNav+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/14.
//

import Foundation
import UIKit
import SwiftUI
import HiBase

extension HiNav {
    
    // MARK: - back
    public func backURLScheme(_ type: BackType? = nil) -> String {
        var parameters = [String: String].init()
        if type != nil {
            parameters[Parameter.type] = type!.rawValue.string
        }
        return urlScheme(host: .back, parameters: parameters)
    }
    
    // MARK: - toast
    public func activateURLScheme(active: Bool = true) -> String {
        urlScheme(host: .toast, parameters: [
            Parameter.active: active.string
        ])
    }
    
    public func deactivateURLScheme() -> String {
        activateURLScheme(active: false)
    }
    
    public func toastURLScheme(_ message: String, active: Bool? = nil) -> String {
        urlScheme(host: .toast, parameters: [
            Parameter.message: message
        ])
    }
    
    // MARK: - alert
    public func alertURLScheme(_ title: String, _ message: String, _ actions: [AlertActionType]) -> String {
        var parameters = [String: String].init()
        if title.isNotEmpty {
            parameters[Parameter.title] = title
        }
        if message.isNotEmpty {
            parameters[Parameter.message] = message
        }
        var actionsValue = ""
        for action in actions {
            guard let title = action.title, title.isNotEmpty else { continue }
            actionsValue += "\(title),"
        }
        if actionsValue.isNotEmpty {
            actionsValue = actionsValue.removingSuffix(",")
            parameters[Parameter.actions] = actionsValue
        }
        return urlScheme(host: .alert, parameters: parameters)
    }
    
    // MARK: - sheet
    public func sheetURLScheme(_ title: String, _ message: String, _ actions: [AlertActionType]) -> String {
        var parameters = [String: String].init()
        if title.isNotEmpty {
            parameters[Parameter.title] = title
        }
        if message.isNotEmpty {
            parameters[Parameter.message] = message
        }
        var actionsValue = ""
        for action in actions {
            guard let title = action.title, title.isNotEmpty else { continue }
            actionsValue += "\(title),"
        }
        if actionsValue.isNotEmpty {
            actionsValue = actionsValue.removingSuffix(",")
            parameters[Parameter.actions] = actionsValue
        }
        return urlScheme(host: .sheet, parameters: parameters)
    }
    
    // MARK: - login
    public func checkNeedLogin(_ target: String) -> Bool {
        guard let url = target.url else { return false }
        guard let host = url.host() else { return false }
        var needLogin = false
        if let compatible = self as? HiNavCompatible {
            if compatible.needLogin(host: host, path: url.path()) {
                needLogin = true
            }
        }
        return needLogin
    }
    
}
