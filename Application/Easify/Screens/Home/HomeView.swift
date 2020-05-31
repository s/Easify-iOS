//
//  HomeView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI

// MARK: HomeView
/// `HomeView` shows a list of tab items with its contents.
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

#if DEBUG
// MARK: - HomeView_Previews: PreviewProvider
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
