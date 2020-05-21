//
//  EasifyNetworkManager.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Combine
import Alamofire
import Foundation

/// Generic network interface which can be used for any network operation.
final class EasifyNetworkManager {

    // MARK: - Properties
    public static let shared = EasifyNetworkManager()
    private let session: Session
    @Atomic private var storage: Set<AnyCancellable> = []

    // MARK: - Lifecycle
    init() {
        session = Session(startRequestsImmediately: false)
    }

    // MARK: - Public
    /// Execute method accepts a parameter of type: `Endpoint(URLRequestConvertible)` and returns a `Future<Request.Response(Decodable), Error>`
    public func execute<Request: Endpoint>(request: Request) {//-> AnyPublisher<Request.Response.Type, NetworkingError> {}

        self.session
        .request(request)
        .publishDecodable(type: Request.Response.self)
        .tryMap { dataResponse in
            //DataResponse<Decodable, AFError>
            switch dataResponse.result {
            case .success(let d):
                print(d)
            case .failure(let e):
                print(e)
            }
            print(dataResponse)
            return dataResponse.data ?? Data()
        }
        .sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished: print("finished")
            case .failure(let error): print(error)
            }
        }) { a in
            print(a)
        }

    }
}