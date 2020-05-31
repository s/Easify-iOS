//
//  RecentlyPlayedTabBarItem.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyDefines

// MARK: - RecentlyPlayedTabBarItem
struct RecentlyPlayedTabBarItem {}

// MARK: RecentlyPlayedTabBarItem: EasifyUITabBarItem
extension RecentlyPlayedTabBarItem: EasifyUITabBarItem {
    var image: Image {
        return Image(systemName: "clock.fill")
    }

    var text: Text {
        return Text(EasifyDefines.Copies.recentlyPlayed)
    }

    var content: AnyView {
        return AnyView(RecentlyPlayedView())
    }
}
