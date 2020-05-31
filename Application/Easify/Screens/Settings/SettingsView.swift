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
struct SettingsView {
    // MARK: - Lifecycle
    init() {
        let appearance = EasifyUIService.navigationBarAppearance()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(EasifyUIDefines.EasifyTabBar.backmostBackgroundColor)
                    .edgesIgnoringSafeArea(.bottom)
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
