//
//  ConnectButtonView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import UIKit
import SwiftUI
import SpotifyLogin

// MARK: ConnectButtonView
struct ConnectButtonView {
    // MARK: Properties
    private let spotifyService: SpotifyService

    // MARK: Lifecycle
    init(spotifyService: SpotifyService) {
        self.spotifyService = spotifyService
    }
}

// MARK: ConnectButtonView: UIViewControllerRepresentable
extension ConnectButtonView: UIViewControllerRepresentable {
    typealias UIViewControllerType = LogInViewController

    func makeUIViewController(context: Context) -> LogInViewController {
        return LogInViewController(spotifyService: spotifyService)
    }

    func updateUIViewController(_ uiViewController: LogInViewController, context: Context) {

    }
}
