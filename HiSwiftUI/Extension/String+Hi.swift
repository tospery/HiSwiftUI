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
    
//    static func deepLink(
//        host: String,
//        path: String? = nil,
//        parameters: [String: String]? = nil
//    ) -> String {
//        var url = "\(UIApplication.shared.urlScheme)://\(host)".url!
//        if let path = path {
//            url.appendPathComponent(path)
//        }
//        if let parameters = parameters {
//            url.appendQueryParameters(parameters)
//        }
//        return url.absoluteString
//    }
    
}
