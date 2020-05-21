//
//  ConnectButtonView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyCore

// MARK: - ConnectButtonView
struct ConnectButtonView {
    // MARK: - Properties
    @EnvironmentObject var spotifyService: SpotifyService
}

// MARK: - ConnectButtonView: UIViewControllerRepresentable
extension ConnectButtonView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SpotifyLoginViewController

    func makeUIViewController(context: Context) -> SpotifyLoginViewController {
        return SpotifyLoginViewController()
    }

    func updateUIViewController(_ uiViewController: SpotifyLoginViewController, context: Context) {

    }
}
