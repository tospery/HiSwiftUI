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

    func waitForValue(matching targetValue: Output) async -> Output where Output: Equatable, Failure == Never {
        await withCheckedContinuation { continuation in
            let cancellable = self
                .filter { $0 == targetValue }
                .first()
                .sink { value in
                    continuation.resume(returning: value)
                }
            _ = cancellable
        }
    }
    
//    func waitForValue(_ target: Output) async -> Output? where Output: Equatable, Failure == Never {
////        await withCheckedContinuation { continuation in
////            let cancellable = self.filter { $0 == target }.first().sink { _ in
////            } receiveValue: { value in
////                continuation.resume(returning: value)
////            }
////            _ = cancellable
////        }
////        for await value in self.values {
////            if value == target {
////                return value
////            }
////        }
////        return nil
//        await withCheckedContinuation { continuation in
//            var cancellable: AnyCancellable?
//            var finishedWithoutValue = true
//            cancellable = self.sink { result in
//                    switch result {
//                    case .finished:
//                        if finishedWithoutValue {
//                            continuation.resume(returning: nil)
//                        }
//                    case let .failure(error):
//                        continuation.resume(returning: nil)
//                    }
//                    cancellable?.cancel()
//                } receiveValue: { value in
//                    if value == target {
//                        finishedWithoutValue = false
//                        continuation.resume(returning: value)
//                    }
//                }
//        }
//    }
    
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

