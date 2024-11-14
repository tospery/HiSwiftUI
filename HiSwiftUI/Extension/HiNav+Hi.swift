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
    
    // MARK: - alert
    public func alertLink(_ title: String, _ message: String, _ actions: [AlertActionType]) -> String {
        var parameters = [String: String].init()
        parameters[Parameter.title] = title
        parameters[Parameter.message] = message
        var actionsValue = ""
        for action in actions {
            guard let title = action.title, title.isNotEmpty else { continue }
            actionsValue += "\(title),"
        }
        if actionsValue.isNotEmpty {
            actionsValue = actionsValue.removingSuffix(",")
            parameters[Parameter.actions] = actionsValue
        }
        return urlString(host: .alert, parameters: parameters)
    }
    
}
