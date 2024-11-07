//
//  String+Hi.swift
//  Pods
//
//  Created by 杨建祥 on 2024/11/7.
//

import Foundation
import SwifterSwift

public extension String {
    
    var isValidAppScheme: Bool {
        guard let url = self.url else { return false }
        return url.scheme == UIApplication.shared.urlScheme
    }
    
}
