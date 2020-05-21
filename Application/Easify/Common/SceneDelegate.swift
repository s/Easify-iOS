//
//  SceneDelegate.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI
import SpotifyLogin

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    // MARK: - Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let scene = scene as? UIWindowScene,
            let delegate = UIApplication.shared.delegate as? AppDelegate,
            let spotifyService = delegate.serviceProvider?.spotifyService
        else {
            return
        }

        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: ContainerView().environmentObject(spotifyService))
        self.window = window
        window.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        _ = SpotifyLogin.shared.applicationOpenURL(url) { (_) in}
    }
}
