//
//  Library.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/15.
//

import Foundation
import SwiftyBeaver
import HiCore
import HiNet

public protocol LibraryCompatible {
    func mySetup()
}

final public class Library {
    
    public static var shared = Library()
    
    public init() {
    }
    
    public func setup() {
        if let compatible = self as? LibraryCompatible {
            compatible.mySetup()
        } else {
            self.basic()
        }
    }
    
    public func basic() {
        logType.addDestination(ConsoleDestination.init())
        logType.addDestination(FileDestination.init())
        ReachPublisher.shared.start()
    }
    
}