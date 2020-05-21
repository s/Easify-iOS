//
//  SpotifyNetworkService.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 20/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import Foundation

/// SpotifyNetworkService provides an interface for Spotify Developer API
public enum SpotifyNetworkService {
    case recentlyPlayedTracks
    
    public func fetch() {
        switch self {
        case .recentlyPlayedTracks:
            EasifyNetworkManager.shared.execute(request: SpotifyRecentlyPlayedEndpoint())
        }
    }
}
