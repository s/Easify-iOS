//
//  RecentlyPlayedView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 29/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyDefines

// MARK: - RecentlyPlayedView
/// `RecentlyPlayedView` shows the list of tracks which were recently played by the authenticated user.
struct RecentlyPlayedView {}

// MARK: - RecentlyPlayedView: View
extension RecentlyPlayedView: View {
    var body: some View {
        Text("Recently Played View").background(Color.yellow)
    }
}

#if DEBUG
// MARK: - RecentlyPlayedView_Previews: PreviewProvider
struct RecentlyPlayedView_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyPlayedView()
    }
}
#endif
