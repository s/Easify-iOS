//
//  SpotifyService+API.swift
//  EasifyCore
//
//  Created by Muhammed Said Özcan on 20/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import EasifyNetwork
import EasifySpotifyDataModels

// MARK: SpotifyService API Endpoints
/// This extension provides an interface for Spotify API interactions.
public extension SpotifyService {
    /// This method makes a HTTP call to `/me/player/recently-played` endpoint of Spotify API.
    static func fetchRecentlyPlayedTracks() {
        SpotifyRecentlyPlayedEndpoint().execute()
    }
}
