//
//  Publisher.swift
//  Pods
//
//  Created by 杨建祥 on 2024/10/16.
//

import SwiftUI
import Combine
import HiCore

private var subscriptions = Set<AnyCancellable>()

public extension Publisher {
    
    func resultPublisher() -> AnyPublisher<Result<Output, Failure>, Never> {
        return map(Result.success)
            .catch { Just(Result.failure($0)) }
            .eraseToAnyPublisher()
    }
    
    func async() async -> Result<Output, Failure> where Failure == Error {
        await withCheckedContinuation { continuation in
            var cancellable: AnyCancellable?
            var finishedWithoutValue = true
            cancellable = first()
                .sink { result in
                    switch result {
                    case .finished:
                        if finishedWithoutValue {
                            continuation.resume(returning: .failure(HiError.unknown))
                        }
                    case let .failure(error):
                        continuation.resume(returning: .failure(error))
                    }
                    cancellable?.cancel()
                } receiveValue: { value in
                    finishedWithoutValue = false
                    continuation.resume(returning: .success(value))
                }
        }
    }

    func asResult() async -> Result<Output, Failure> where Failure == Error {
        do {
            for try await value in self.values {
                return .success(value)
            }
        } catch {
            return .failure(error)
        }
        return .failure(HiError.unknown)
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

