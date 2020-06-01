//
//  RecentlyPlayedTabBarItem.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import Combine
import EasifyUI
import EasifyCore
import SpotifyLogin
import EasifyDefines
import EasifySpotifyDataModels

// MARK: - RecentlyPlayedTabBarItem
struct RecentlyPlayedTabBarItem {
    // MARK: Properties
    private let remoteDataSource: SpotifyRecentlyPlayedEndpoint
    private let viewModel: RecentlyPlayedViewModel
    @EnvironmentObject var spotifyService: SpotifyService

    // MARK: - Lifecycle
    init() {
        remoteDataSource = SpotifyRecentlyPlayedEndpoint()
        viewModel = RecentlyPlayedViewModel(remoteDataSource: remoteDataSource)
    }
}

// MARK: RecentlyPlayedTabBarItem: EasifyUITabBarItem
extension RecentlyPlayedTabBarItem: EasifyUITabBarItem {
    var image: Image {
        return Image(systemName: "clock.fill")
    }

    var text: Text {
        return Text(EasifyDefines.Copies.recentlyPlayed)
    }

    var content: AnyView {
        return AnyView(RecentlyPlayedView(viewModel: viewModel))
    }
}
