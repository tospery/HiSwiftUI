//
//  Appdata.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/27.
//

import UIKit
import SwiftUI
import Combine
import HiBase

final public class Appdata: CustomStringConvertible {
    
    public var isDark: Bool? {
        didSet {
            UserDefaults.standard.set(isDark, forKey: Parameter.isDark)
        }
    }
    
    public var accentColor: String {
        didSet {
            UserDefaults.standard.set(accentColor, forKey: Parameter.accentColor)
        }
    }
    
    public var lastLaunchedVersion: String? {
        didSet {
            UserDefaults.standard.set(lastLaunchedVersion, forKey: Parameter.lastLaunchedVersion)
        }
    }
    
    public static var shared = Appdata()
    
    public init() {
        if UserDefaults.standard.object(forKey: Parameter.isDark) != nil {
            self.isDark = UserDefaults.standard.bool(forKey: Parameter.isDark)
        }
        self.accentColor = UserDefaults.standard.string(forKey: Parameter.accentColor) ?? ""
        if self.accentColor.isEmpty {
            self.accentColor = Color("AccentColor").hexString
        }
        if self.accentColor.isEmpty {
            self.accentColor = Color.accentColor.hexString
        }
        self.lastLaunchedVersion = UserDefaults.standard.string(forKey: Parameter.lastLaunchedVersion)
    }
    
//    public func pref(isDark: Bool? = nil, accentColor: String? = nil, locale: String? = nil) {
////        if isDark == nil {
////            if self.isDark == nil && UserDefaults.standard.object(forKey: Parameter.isDark) != nil {
////                self.isDark = UserDefaults.standard.bool(forKey: Parameter.isDark)
////            }
////        } else {
////            self.isDark = isDark
////            UserDefaults.standard.set(self.isDark, forKey: Parameter.isDark)
////        }
//        
////        if self.accentColor?.isEmpty ?? true {
////            if self.accentColor == nil {
////                self.accentColor = UserDefaults.standard.string(forKey: Parameter.accentColor)
////            }
////        } else {
////            self.accentColor = accentColor
////            UserDefaults.standard.set(self.accentColor, forKey: Parameter.accentColor)
////        }
//    }
    
    public var description: String {
        "isDark: \(self.isDark), accentColor: \(self.accentColor), lastLaunchedVersion: \(self.lastLaunchedVersion)"
    }
    
}
