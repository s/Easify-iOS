//
//  LoginView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//
import SwiftUI

// MARK: LoginView
struct LoginView: View {
    // MARK: Properties
    @ObservedObject private var loginViewModel = LoginViewModel()
    private let spotifyService: SpotifyService

    // MARK: Lifecycle
    init(spotifyService: SpotifyService) {
        self.spotifyService = spotifyService
    }

    // MARK: UI
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .center, spacing: Constants.Spacings.quadruple.rawValue) {
                AppNameView()

                VStack(spacing: Constants.Spacings.single.rawValue) {
                    DescriptionTextView()
                    ConnectButtonView(spotifyService: spotifyService)
                        .frame(minWidth: 0,
                               maxWidth: UIScreen.main.bounds.width,
                               minHeight: 0,
                               maxHeight: 60)
                }
            }.offset(x: 0, y: -Constants.Spacings.double.rawValue)
        }
    }
}
