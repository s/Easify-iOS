//
//  SpotifyEndpoint.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import EasifyCore
import EasifyDefines
import EasifyNetwork

// MARK: - SpotifyEndpoint
public protocol SpotifyEndpoint: Endpoint, AuthorizableEndpoint {}

// MARK: - Endpoint Protocol Default Values
extension SpotifyEndpoint {
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "api.spotify.com"))
    }

    public var additionalHeaders: [String: String] {
        var headers: [String: String] = [:]
        _ = authTokenPromise().sink(receiveCompletion: {_ in }, receiveValue: { token in
            headers["Authorization"] = "Bearer \(token)"
        })
        return headers
    }

    public var authTokenPromise: AuthorizableEndpointPromiseType {
        return { SpotifyService.getAccessToken() }
    }
}
