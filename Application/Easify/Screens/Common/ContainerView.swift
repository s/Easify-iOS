//
//  ContainerView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyCore

// MARK: - ContainerView
/// Provides a view based on the user authorization status with Spotify API. If the user is logged in returns `HomeView` otherwise returns `LoginView`.
struct ContainerView {
    // MARK: - Properties
    @EnvironmentObject var spotifyService: SpotifyService
}

// MARK: - ContainerView: View
extension ContainerView: View {
    var body: some View {
        if spotifyService.isLoggedIn {
            return AnyView(HomeView())
        } else {
            return AnyView(LoginView())
        }
    }
}

#if DEBUG
// MARK: - ContainerView_Previews: PreviewProvider
struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
#endif
