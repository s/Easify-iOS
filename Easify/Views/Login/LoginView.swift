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

    // MARK: UI
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: Constants.Spacings.quadruple.rawValue) {
                AppNameView()
                VStack(spacing: Constants.Spacings.single.rawValue) {
                    DescriptionTextView()
                    ConnectButtonView(isEnabled: !loginViewModel.isConnecting)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
