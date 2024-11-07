//
//  Appearance.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/15.
//

import Foundation
import UIKit
import HiCore
import SwiftUI

public protocol AppearanceCompatible {
    func myConfig()
}

final public class Appearance {
    
    public static var shared = Appearance()
    
    public init() {
    }
    
    public func config() {
        if let compatible = self as? AppearanceCompatible {
            compatible.myConfig()
        } else {
            self.basic()
        }
    }
    
    public func basic() {
        // NavBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .systemBackground
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navigationBarAppearance.backButtonAppearance = backButtonAppearance
        let backIndicatorImage = UIImage.back.withRenderingMode(.alwaysTemplate)
        // .withTintColor(Color.accentColor.uiColor, renderingMode: .alwaysTemplate)
        navigationBarAppearance.setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().tintColor = Color.accentColor.uiColor
        UINavigationBar.appearance().barTintColor = Color.secondary.uiColor
        
        // TabBar
        let tabBarAppearance = UITabBarAppearance.init()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .systemBackground
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().tintColor = Color.accentColor.uiColor
        UITabBar.appearance().unselectedItemTintColor = Color.secondary.uiColor
        
        // TableView
        //        UITableView.appearance().sectionHeaderTopPadding = 0
        //        UITableView.appearance().rowHeight = 20
    }
    
}