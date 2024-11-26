//
//  Helper.swift
//  HiSwiftUI
//
//  Created by 杨建祥 on 2024/10/14.
//

import SwiftUI
import Combine
import HiBase
import HiCore

public let profileService = CurrentValueSubject<(any ProfileType)?, Never>(nil)

public func logEnvironment() {
    logger.print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path ?? "", module: .hiSwiftUI)
    logger.print("运行环境: \(UIApplication.shared.inferredEnvironment)", module: .hiSwiftUI)
    logger.print("设备型号: \(UIDevice.current.modelName)", module: .hiSwiftUI)
    logger.print("硬件标识: \(UIDevice.current.uuid)", module: .hiSwiftUI)
    logger.print("系统版本: \(UIDevice.current.systemVersion)", module: .hiSwiftUI)
    logger.print("屏幕尺寸: \(UIScreen.main.bounds.size)", module: .hiSwiftUI)
    logger.print("安全区域: \(safeArea)", module: .hiSwiftUI)
    logger.print("状态栏(\(statusBarHeightConstant))|导航栏(\(navigationBarHeight))|标签栏(\(tabBarHeight))", module: .hiSwiftUI)
}

public func convertToResult<Output>(
    publisher: AnyPublisher<Output, Error>,
    completion: @escaping (Result<Output, any Error>) -> Void
) -> AnyCancellable {
    publisher
        .sink { state in
            switch state {
            case let .failure(error):
                completion(.failure(error))
            case .finished:
                break
            }
        } receiveValue: { value in
            completion(.success(value))
        }
}

//public extension AnyPublisher {
//    func async(cancellables: inout Set<AnyCancellable>) async throws -> Output {
//        try await withCheckedThrowingContinuation { continuation in
//            self.sink(
//                receiveCompletion: { completion in
//                    switch completion {
//                    case .finished:
//                        break
//                    case let .failure(error):
//                        continuation.resume(throwing: error)
//                    }
//                },
//                receiveValue: { value in
//                    continuation.resume(returning: value)
//                }
//            )
//            .store(in: &cancellables)
//        }
//    }
//}
