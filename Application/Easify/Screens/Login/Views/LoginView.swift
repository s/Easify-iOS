//
//  LoginView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyCore
import EasifyDefines

// MARK: - LoginView
struct LoginView: View {
    // MARK: - Properties
    @ObservedObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var spotifyService: SpotifyService

    // MARK: - UI
    var body: some View {
        LoadingView(isShowing: .constant(spotifyService.isAttemptingToLogin), message: EasifyDefines.Copies.loading) {
            ZStack {
                BackgroundView()
                VStack(alignment: .center, spacing: EasifyUIDefines.Spacings.quadruple) {
                    AppNameView()

                    VStack(spacing: EasifyUIDefines.Spacings.single) {
                        DescriptionTextView()
                        ConnectButtonView()
                            .frame(minWidth: 0,
                                   maxWidth: UIScreen.main.bounds.width,
                                   minHeight: 0,
                                   maxHeight: 60)
                    }
                }.offset(x: 0, y: -EasifyUIDefines.Spacings.double)
            }
        }
    }
}
