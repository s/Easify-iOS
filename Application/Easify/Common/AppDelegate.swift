//
//  AppDelegate.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 16/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import EasifyCore
import SpotifyLogin

@UIApplicationMain
class AppDelegate: UIResponder {
    // MARK: - Properties
    private(set) var serviceProvider: ServiceProvider?
}

// MARK: - AppDelegate: UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    // MARK: - Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        do {
            self.serviceProvider = try ServiceProvider()
        } catch {
            print(error.localizedDescription)
            return false
        }
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { (_) in }
        return handled
    }

    // MARK: - UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
