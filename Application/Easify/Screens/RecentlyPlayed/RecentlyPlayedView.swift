//
//  RecentlyPlayedView.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 29/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI
import EasifyUI
import EasifyCore
import EasifyDefines

// MARK: - RecentlyPlayedView
/// `RecentlyPlayedView` shows the list of tracks which were recently played by the authenticated user.
struct RecentlyPlayedView {
    // MARK: - Properties
    @ObservedObject var viewModel: RecentlyPlayedViewModel

    // MARK: - Lifecycle
    init(viewModel: RecentlyPlayedViewModel) {
      self.viewModel = viewModel
    }
}

// MARK: - RecentlyPlayedView: View
extension RecentlyPlayedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
              List {
                if viewModel.recentlyPlayedTracks.isEmpty {
                  Section {
                    Text("No results").foregroundColor(.gray)
                  }
                } else {
                  Section {
                    ForEach(viewModel.recentlyPlayedTracks, content: RecentlyPlayedViewRow.init(viewModel:))
                  }
                }
              }
              .onAppear(perform: viewModel.refresh)
              .listStyle(GroupedListStyle())
              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
              .background(EasifyUIDefines.EasifyTabBar.backmostBackgroundColor)
              .edgesIgnoringSafeArea(.bottom)
              .navigationBarTitle(Text(EasifyDefines.Copies.recentlyPlayed))
            }
        }
    }
}
