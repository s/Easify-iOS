//
//  RecentlyPlayedViewModel.swift
//  Easify
//
//  Created by Muhammed Said Özcan on 01/06/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Combine
import EasifyCore
import EasifySpotifyDataModels

// MARK: - RecentlyPlayedViewModel
/// Provides a view model for the `Recently Played` screen.
final class RecentlyPlayedViewModel: ObservableObject {
    // MARK: - Properties
    @Published var recentlyPlayedTracks: [RecentlyPlayedRowViewModel] = []
    private let remoteDataSource: SpotifyRecentlyPlayedEndpoint
    private var disposables = Set<AnyCancellable>()

    // MARK: - Lifecycle
    init(remoteDataSource: SpotifyRecentlyPlayedEndpoint) {
        self.remoteDataSource = remoteDataSource
    }

    // MARK: - Public
    func refresh() {
        remoteDataSource
            .execute()
            .map { response in
                response.items.map(RecentlyPlayedRowViewModel.init)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure:
                  self.recentlyPlayedTracks = []
                case .finished:
                  break
                }
            }) { [weak self] response in
                guard let self = self else { return }
                self.recentlyPlayedTracks = response
            }.store(in: &disposables)
    }
}
