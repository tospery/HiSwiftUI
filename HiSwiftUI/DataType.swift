//
//  DataType.swift
//  HiDomain
//
//  Created by 杨建祥 on 2024/5/15.
//

import UIKit
import DeviceKit

public protocol ServiceProvider { }
public protocol ProviderProtocol { }

public enum Localization: String, Codable {
    case chinese    = "zh-Hans"
    case english    = "en"
    
    public static let allValues = [chinese, english]
    
    public var preferredLanguages: [String] { [self.rawValue] }
}

public enum MappingError: Error {
    case emptyData
    case invalidJSON(message: String)
    case unknownType
}

// Take from https://github.com/RxSwiftCommunity/RxOptional/blob/master/Sources/RxOptional/OptionalType.swift
// Originally from here: https://github.com/artsy/eidolon/blob/24e36a69bbafb4ef6dbe4d98b575ceb4e1d8345f/Kiosk/Observable%2BOperators.swift#L30-L40
// Credit to Artsy and @ashfurrow
public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
    init(nilLiteral: ())
}

extension Optional: OptionalType {
    /// Cast `Optional<Wrapped>` to `Wrapped?`
    public var value: Wrapped? { self }
}

public enum HiPagingStyle: Int, Codable {
    case basic
    case navigationBar
    case pageViewController
}

public protocol BooleanType {
    var boolValue: Bool { get }
}

extension Bool: BooleanType {
    public var boolValue: Bool { return self }
}

public enum HiRequestMode: Int {
    case load, refresh, loadMore, update, reload
}

public protocol ImageSource {
}
extension URL: ImageSource {}
extension UIImage: ImageSource {}

public protocol Textable {
    func toString(_ value: Any?) -> String?
}
extension Textable {
    func toString(_ value: Any?) -> String? { nil }
}

@objc public protocol NSSwiftyLoadProtocol: AnyObject {
    @objc static func swiftyLoad()
}

public protocol StringRawRepresentable {
    var stringRawValue: String { get }
}

extension StringRawRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var stringRawValue: String { return self.rawValue }
}

extension StringRawRepresentable where Self: RawRepresentable, Self.RawValue == Int {
    var stringRawValue: String { return self.rawValue.string }
}
