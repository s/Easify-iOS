//
//  LoginView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 17/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyCore

// MARK: LoginView
struct LoginView: View {
    // MARK: Properties
    @ObservedObject private var loginViewModel = LoginViewModel()

    // MARK: UI
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .center, spacing: Constants.Spacings.quadruple) {
                AppNameView()

                VStack(spacing: Constants.Spacings.single) {
                    DescriptionTextView()
                    ConnectButtonView()
                        .frame(minWidth: 0,
                               maxWidth: UIScreen.main.bounds.width,
                               minHeight: 0,
                               maxHeight: 60)
                }
            }.offset(x: 0, y: -Constants.Spacings.double)
        }
    }
}
