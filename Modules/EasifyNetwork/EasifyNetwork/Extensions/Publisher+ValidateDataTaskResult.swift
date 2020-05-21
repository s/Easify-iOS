//
//  Publisher+ValidateDataTaskResult.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 20/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import Foundation

typealias DataTaskResult = (data: Data, response: URLResponse)

//extension Publisher where Output == DataTaskResult {
//    // 200..<300.contains($0)
//    func validateStatusCode(_ isValid: @escaping (Int) -> Bool) -> AnyPublisher<Output, NetworkingError> {
//        return validateResponse { (data, response) in
//            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
//            return isValid(statusCode)
//        }
//    }
//
//    private func validateResponse(_ isValid: @escaping (DataTaskResult) -> Bool) -> AnyPublisher<Output, NetworkingError> {
//        return self
//            .mapError { .connectionError($0) }
//            .flatMap { (result) -> AnyPublisher<DataTaskResult, NetworkingError> in
//                let (data, error) = result
//                if isValid(result) {
//                    return Just(result)
//                        .setFailureType(to: NetworkingError.self)
//                        .eraseToAnyPublisher()
//                } else {
//                    return Fail(outputType: Output.self, failure: .unsuccessfulNetworkError(data))
//                        .eraseToAnyPublisher()
//                }}
//            .eraseToAnyPublisher()
//    }
//}
