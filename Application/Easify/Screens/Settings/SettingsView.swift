//
//  SettingsView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 29/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyDefines

// MARK: - SettingsView
/// `SettingsView` provides list of options user can select including logging out functionality.
struct SettingsView {}

// MARK: - SettingsView: View
extension SettingsView: View {
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                NavigationView {
                    VStack(alignment: .leading) {
                        UserProfileView()
                        Spacer()
                    }
                    .navigationBarTitle(Text(EasifyDefines.Copies.settings))
                }
            }
        }
    }
}

// MARK: - SettingsView_Previews: PreviewProvider
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
