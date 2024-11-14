//
//  DataType.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/14.
//

import Foundation
import UIKit

public protocol AlertActionType {
    var title: String? { get }
    var style: UIAlertAction.Style { get }
}

extension AlertActionType {
    var style: UIAlertAction.Style {
        return .destructive
    }
}
