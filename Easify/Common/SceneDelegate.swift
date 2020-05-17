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

    // MARK: Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let scene = scene as? UIWindowScene,
            let delegate = UIApplication.shared.delegate as? AppDelegate,
            let spotifyService = delegate.serviceProvider?.spotifyService
        else {
            return
        }

        spotifyService.isLoggedIn { [weak self] (isLoggedIn) in
            if isLoggedIn {
                self?.setupWindow(for: HomeView(), in: scene)
            } else {
                self?.setupWindow(for: LoginView(spotifyService: spotifyService), in: scene)
            }
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
            return
        }
        _ = SpotifyLogin.shared.applicationOpenURL(url) { (_) in}
    }

    // MARK: Private
    private func setupWindow<ContentView>(for view: ContentView, in windowScene: UIWindowScene) where ContentView: View {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: view)
        self.window = window
        window.makeKeyAndVisible()
    }
}
