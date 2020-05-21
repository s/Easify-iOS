//
//  SpotifyLoginViewController.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import EasifyCore
import SpotifyLogin

/// `SpotifyLoginViewController` provides a wrapper around `SpotifyLoginButton` which can be used when showing login with Spotify option.
public class SpotifyLoginViewController: UIViewController {
    // MARK: - Properties
    private(set) lazy var loginButton: SpotifyLoginButton? = {
        return SpotifyLoginButton(viewController: self, scopes: SpotifyService.loginScopes)
    }()

    // MARK: - Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let loginButton = loginButton {
            view.addSubview(loginButton)
        }
    }

    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton?.center = self.view.center
    }
}
