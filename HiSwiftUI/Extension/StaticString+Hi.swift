//
//  StaticString+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/12/20.
//

import SwiftUI
import HiCore
import SwifterSwift
import SwiftUIKit_Hi

public extension StaticString {
    
    var localizedString: String {
        if profileService.value?.localization == .english {
            return englishLocalizedString
        }
        return chineseLocalizedString
    }
    
}
