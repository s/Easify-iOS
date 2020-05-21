//
//  API.swift
//  Networking
//
//  Created by Ilter Cengiz on 22/12/17.
//  Copyright © 2017 Ilter Cengiz. All rights reserved.
//

import Foundation

/// Represents an environment to connect to
public struct API {

    /// Root URL to the environment
    public var baseURL: BaseURL

    /// Default header values to be included in every request for this environment
    public var headers: [String: String]

    /// Init
    public init(baseURL: BaseURL, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }

}
