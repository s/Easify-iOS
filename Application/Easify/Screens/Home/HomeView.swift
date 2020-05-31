//
//  HomeView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import SpotifyLogin
import EasifyUI

// MARK: HomeView
struct HomeView {
    // MARK: - Properties
    private let contents: [EasifyUITabBarItem] = [
        RecentlyPlayedTabBarItem(),
        SettingsTabBarItem()
    ]
}

// MARK: - HomeView: View
extension HomeView: View {
    var body: some View {
        EasifyUITabBar(items: contents, selectedIndex: 0)
    }
}

// MARK: - HomeView_Previews: PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
