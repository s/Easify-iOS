//
//  ContainerView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 18/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import SwiftUI
import EasifyCore

struct ContainerView: View {
    // MARK: Properties
    @EnvironmentObject var spotifyService: SpotifyService

    var body: some View {
        if spotifyService.isLoggedIn {
            return AnyView(HomeView())
        } else {
            return AnyView(LoginView())
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
