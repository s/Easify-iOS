//
//  EasifyUIService.swift
//  EasifyUI
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: EasifyUIService
public final class EasifyUIService {
    // MARK: - Public
    public static func configureNavigationBarApperance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .tertiarySystemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
