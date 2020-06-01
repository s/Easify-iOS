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
    private static let successRange = (200..<299)
    private static let contentType = "application/json"

    // MARK: - Lifecycle
    init() {
        session = Session(startRequestsImmediately: false)
    }

    // MARK: - Public
    /// Execute method accepts a parameter of type: `Endpoint(URLRequestConvertible)` and returns a `Future<Request.Response(Decodable), Error>`
    func execute<Request: Endpoint>(request: Request) -> Future<Request.Response, Error> {
        return Future<Request.Response, Error> { promise in
            self.session.request(request)
                .validate(statusCode: EasifyNetworkManager.successRange)
                .cURLDescription(calling: { print($0) })
                .validate(contentType: [EasifyNetworkManager.contentType])
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let model = try JSONDecoder().decode(Request.Response.self, from: data)
                            promise(.success(model))
                        } catch let error as DecodingError {
                            promise(.failure(NetworkingError.decodingFailed(error)))
                        } catch {
                            promise(.failure(NetworkingError.undefined(error)))
                        }
                    case .failure(let error):
                        promise(.failure(NetworkingError.afError(error)))
                    }
                }.resume()
        }
    }
}
