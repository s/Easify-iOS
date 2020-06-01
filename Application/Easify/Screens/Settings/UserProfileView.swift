//
//  UserProfileView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 31/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyCore
import SpotifyLogin
import EasifyDefines

// MARK: - UserProfileView
struct UserProfileView {
    // MARK: - Properties
    @State private var showAlert = false
    @EnvironmentObject var spotifyService: SpotifyService
}

// MARK: - UserProfileView: View
extension UserProfileView: View {
    var body: some View {
        HStack(spacing: EasifyUIDefines.Spacings.double) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: EasifyUIDefines.Sizes.userProfileIcon,
                           height: EasifyUIDefines.Sizes.userProfileIcon)
                    .foregroundColor(EasifyUIDefines.Colors.easifyGray)
                VStack(alignment: .leading) {
                    Text(EasifyDefines.Copies.userProfileHeadline)
                        .font(.headline)
                        .italic()
                    Text(spotifyService.authenticatedUsername ?? "").font(.callout)
                }
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text(EasifyDefines.Copies.logout).font(.headline).foregroundColor(.red)
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text(EasifyDefines.Copies.loggingOut),
                      message: Text(EasifyDefines.Copies.confirmLogoutText),
                      primaryButton: .default(Text(EasifyDefines.Copies.yes), action: {
                        self.spotifyService.logout()
                      }), secondaryButton: .cancel())
            }
        }
        .padding()
    }
}

#if DEBUG
// MARK: - UserProfileView_Previews: PreviewProvider
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
#endif
