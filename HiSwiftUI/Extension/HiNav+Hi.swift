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
    public func backURLString(_ type: BackType? = nil) -> String {
        var parameters = [String: String].init()
        if type != nil {
            parameters[Parameter.type] = type!.rawValue.string
        }
        return urlString(host: .back, parameters: parameters)
    }
    
    // MARK: - toast
    public func toastActivityURLString(_ active: Bool) -> String {
        urlString(host: .toast, parameters: [
            Parameter.active: active.string
        ])
    }
    
    public func toastMessageURLString(_ message: String, active: Bool? = nil) -> String {
        urlString(host: .toast, parameters: [
            Parameter.message: message
        ])
    }
    
    // MARK: - alert
    public func alertURLString(_ title: String, _ message: String, _ actions: [AlertActionType]) -> String {
        var parameters = [String: String].init()
        if title.isNotEmpty {
            parameters[Parameter.title] = title
        }
        if message.isNotEmpty {
            parameters[Parameter.message] = message
        }
        var jsonString = actions.map { $0.description }.filter { $0.isNotEmpty }.jsonString() ?? ""
        if jsonString.isNotEmpty {
            parameters[Parameter.actions] = jsonString
        }
        return urlString(host: .alert, parameters: parameters)
    }
    
    // MARK: - sheet
    public func sheetURLString(_ title: String, _ message: String, _ actions: [AlertActionType]) -> String {
        var parameters = [String: String].init()
        if title.isNotEmpty {
            parameters[Parameter.title] = title
        }
        if message.isNotEmpty {
            parameters[Parameter.message] = message
        }
        var jsonString = actions.map { $0.description }.filter { $0.isNotEmpty }.jsonString() ?? ""
        if jsonString.isNotEmpty {
            parameters[Parameter.actions] = jsonString
        }
        return urlString(host: .sheet, parameters: parameters)
    }
    
    // MARK: - popup
    public func popupURLString(_ type: String, _ data: String) -> String {
        var parameters = [String: String].init()
        if type.isNotEmpty {
            parameters[Parameter.type] = type
        }
        if data.isNotEmpty {
            parameters[Parameter.data] = data
        }
        return urlString(host: .popup, parameters: parameters)
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
