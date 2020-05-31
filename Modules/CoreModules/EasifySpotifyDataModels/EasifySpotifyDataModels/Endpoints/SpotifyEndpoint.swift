//
//  SpotifyEndpoint.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import EasifyDefines
import EasifyNetwork

// MARK: - SpotifyEndpoint
public protocol SpotifyEndpoint: Endpoint {}

// MARK: - Endpoint Protocol Default Values
extension SpotifyEndpoint {
    /// This implementation will save us from implementing the same `api` variable
    /// in every endpoint for Eventbrite
    public var api: API {
        return API(baseURL: BaseURL(scheme: "https", host: "api.spotify.com"))
    }

    public var additionalHeaders: [String: String] {
        let key = EasifyDefines.StorageKeys.spotifyAccessToken
        if let token = UserDefaults.standard.string(forKey: key) {
            return ["Authorization": "Bearer \(token)"]
        }
        return [:]
    }
}
