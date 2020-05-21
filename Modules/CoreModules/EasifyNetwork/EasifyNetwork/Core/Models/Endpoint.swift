//
//  Endpoint.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation
import Alamofire

/// Holds all the information to build a request
public protocol Endpoint: URLRequestConvertible {

    /// A response type should be defined with every `Endpoint` implementation
    /// This type will be used to parse the response into concrete types
    associatedtype Response: Decodable

    /// The API definition this endpoint belongs to
    var api: API { get }

    /// Path component for this endpoint
    var path: String { get }

    /// HTTP method this endpoint uses
    var method: HTTPMethod { get }

    /// Parameters will be parsed based on the HTTP method
    /// For `GET` it will be URL encoding and for `POST` it will be HTTP body JSON encoding
    var parameters: [String: Any] { get }

    /// Any additional header values that should be added along with default header
    /// values defined in `API`
    /// Users can override default header values of API using the same keys
    var additionalHeaders: [String: String] { get }

}

// MARK: - - Default values

public extension Endpoint {

    /// Return an empty dictionary for parameters
    var parameters: [String: Any] { return [:] }

    /// Return an empty dictionary for additional header values
    var additionalHeaders: [String: String] { return [:] }

}

// MARK: - - URLRequestConvertible

extension Endpoint {

    /// Construct `URLRequest`
    public func asURLRequest() throws -> URLRequest {

        // Construct the URL
        var components = URLComponents()
        components.scheme = api.baseURL.scheme
        components.host = api.baseURL.host
        components.path = path
        // This will throw an error if provided information is not correct
        let url = try components.asURL()
        // Create the request and assign appropriate values
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = api.headers.merging(additionalHeaders, uniquingKeysWith: { $1 })
        // Try to encode request and return it
        return try URLEncoding(destination: .methodDependent).encode(request, with: parameters)
    }

}
