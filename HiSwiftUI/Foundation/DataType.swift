//
//  DataType.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/14.
//

import Foundation
import UIKit

public protocol AlertActionType: CustomStringConvertible {
    var style: UIAlertAction.Style { get }
}

extension AlertActionType {
    var style: UIAlertAction.Style {
        return .default
    }
}
