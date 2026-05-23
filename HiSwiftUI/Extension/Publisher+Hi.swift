//
//  Publisher.swift
//  Pods
//
//  Created by 杨建祥 on 2024/10/16.
//

import SwiftUI
import Combine
import HiCore

public var disposeBag = Set<AnyCancellable>.init()

public extension Publisher {

//    func async() async throws -> Output {
//        try await withCheckedThrowingContinuation { continuation in
//            var finishedWithoutValue = true
//            var cancellable: AnyCancellable?
//            cancellable = self
//                .sink { completion in
//                    cancellable?.cancel()
//                    switch completion {
//                    case .finished:
//                        if finishedWithoutValue {
//                            continuation.resume(throwing: HiError.unknown)
//                        }
//                    case let .failure(error):
//                        continuation.resume(throwing: error)
//                    }
//                } receiveValue: { value in
//                    cancellable?.cancel()
//                    finishedWithoutValue = false
//                    continuation.resume(returning: value)
//                }
//            cancellable?.store(in: &disposeBag)
//        }
//    }

    func asResult() async -> Result<Output, Error> {
        do {
            for try await value in self.values {
                return .success(value)
            }
        } catch {
            return .failure(error)
        }
        return .failure(HiError.unknown)
    }
    
    func asOutput() async -> Output? {
        do {
            for try await value in self.values {
                return value
            }
        } catch {
            return nil
        }
        return nil
    }
    
    func asError() async -> Error? {
        do {
            for try await _ in self.values {
                return nil
            }
        } catch {
            return error
        }
        return nil
    }
    
    func asStream() -> AsyncThrowingStream<Output, Error> {
        AsyncThrowingStream<Output, Error> { continuation in
            self.sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    continuation.finish()
                case .failure(let error):
                    continuation.finish(throwing: error)
                }
            }, receiveValue: { value in
                continuation.yield(value)
            }).store(in: &disposeBag)
        }
    }
    
}
