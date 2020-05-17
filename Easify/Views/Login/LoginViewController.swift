//
//  LoginViewController.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SpotifyLogin

class LogInViewController: UIViewController {
    // MARK: Properties
    private let spotifyService: SpotifyService
    private(set) lazy var loginButton: SpotifyLoginButton? = {
        return SpotifyLoginButton(viewController: self, scopes: self.spotifyService.loginScopes)
    }()

    // MARK: Lifecycle
    init(spotifyService: SpotifyService) {
        self.spotifyService = spotifyService
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let loginButton = loginButton {
            view.addSubview(loginButton)
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loginButton?.center = self.view.center
    }
}
