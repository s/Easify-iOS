//
//  SceneDelegate.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: Properties
    private lazy var serviceProvider: ServiceProvider? = {
        do {
            return try ServiceProvider()
        } catch {
            print(error)
            return nil
        }
    }()
    var window: UIWindow?

    // MARK: Lifecycle
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        let contentView = LoginView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url, let appRemote = serviceProvider?.spotifyService.appRemote else {
            return
        }
        let parameters = appRemote.authorizationParameters(from: url)
        if let accessToken = parameters?[SPTAppRemoteAccessTokenKey] {
            appRemote.connectionParameters.accessToken = accessToken
            serviceProvider?.spotifyService.update(accessToken: accessToken)
        } else if let errorDescription = parameters?[SPTAppRemoteErrorDescriptionKey] {
            print(errorDescription)
        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        guard serviceProvider?.spotifyService.appRemote.connectionParameters.accessToken != nil else { return }
        serviceProvider?.spotifyService.appRemote.connect()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        serviceProvider?.spotifyService.appRemote.disconnect()
    }
}
