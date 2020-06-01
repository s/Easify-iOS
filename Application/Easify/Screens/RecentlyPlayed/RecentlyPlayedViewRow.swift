//
//  RecentlyPlayedViewRow.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 01/06/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import SwiftUI

// MARK: - RecentlyPlayedView
/// Provides a view for a row in the `Recently Played` screen.
struct RecentlyPlayedViewRow {
    // MARK: - Properties
    private let viewModel: RecentlyPlayedRowViewModel

    // MARK: - Lifecycle
    init(viewModel: RecentlyPlayedRowViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - RecentlyPlayedView: View
extension RecentlyPlayedViewRow: View {
    var body: some View {
        Text(viewModel.trackName)
    }
}
