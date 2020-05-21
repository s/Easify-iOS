//
//  SpotifyRecentlyPlayedEndpoint.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyRecentlyPlayedEndpoint
public struct SpotifyRecentlyPlayedEndpoint: SpotifyEndpoint {
    public typealias Response = SpotifyPagination<SpotifyPlayHistoryItem>
    public var path: String = "/v1/me/player/recently-played"
    public var method: HTTPMethod = .get

    // MARK: Lifecycle
    public init() {}
}
