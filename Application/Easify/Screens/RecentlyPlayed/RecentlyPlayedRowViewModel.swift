//
//  RecentlyPlayedRowViewModel.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 01/06/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifySpotifyDataModels

// MARK: - RecentlyPlayedRowViewModel
/// Provides a view model for a row item in `Recently Played` screen.
struct RecentlyPlayedRowViewModel {
    // MARK: - Properties
    private let recentlyPlayedTrackItem: SpotifyPlayHistoryItem
    var trackName: String {
        return recentlyPlayedTrackItem.track.name
    }

    // MARK: - Lifecycle
    init(item: SpotifyPlayHistoryItem) {
        self.recentlyPlayedTrackItem = item
    }
}

// MARK: RecentlyPlayedRowViewModel: Identifiable
extension RecentlyPlayedRowViewModel: Identifiable {
    var id: String {
        return recentlyPlayedTrackItem.track.identifier
    }
}
