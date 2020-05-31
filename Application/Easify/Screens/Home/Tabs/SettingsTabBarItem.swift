//
//  SettingsTabBarItem.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyDefines

// MARK: - SettingsTabBarItem
struct SettingsTabBarItem {}

// MARK: - SettingsTabBarItem: EasifyUITabBarItem
extension SettingsTabBarItem: EasifyUITabBarItem {
    var image: Image {
        return Image(systemName: "gear")
    }

    var text: Text {
        return Text(EasifyDefines.Copies.settings)
    }

    var content: AnyView {
        return AnyView(SettingsView())
    }
}
