//
//  SettingsView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 29/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - SettingsView
/// `SettingsView` provides list of options user can select including logging out functionality.
struct SettingsView {}

// MARK: - SettingsView: View
extension SettingsView: View {
    var body: some View {
        Text("Settings View")
    }
}

// MARK: - SettingsView_Previews: PreviewProvider
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
