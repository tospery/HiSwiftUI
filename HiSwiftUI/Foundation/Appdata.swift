//
//  Appdata.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/27.
//

import Foundation
import Combine
import HiBase

public let preferenceService = CurrentValueSubject<(any PreferenceType)?, Never>(nil)

final public class Appdata {
    
    public static var shared = Appdata()
    
    public init() {
    }
    
    public func inject(_ preference: any PreferenceType) {
        preferenceService.send(preference)
    }
    
}
