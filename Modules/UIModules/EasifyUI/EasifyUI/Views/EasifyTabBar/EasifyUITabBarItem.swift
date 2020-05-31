//
//  EasifyUITabBarItem.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - EasifyUITabBarItem
public protocol EasifyUITabBarItem {
    // MARK: - Properties
    var image: Image { get }
    var text: Text { get }
    var content: AnyView { get }
}
