//
//  SpotifyPlayHistoryItem.swift
//  EasifyNetwork
//
//  Created by Muhammed Said Özcan on 19/05/2020.
//  Copyright © 2020 Muhammed Said Özcan. All rights reserved.
//

import Foundation

// MARK: - SpotifyPlayHistoryItem
/// Developer documentation: https://developer.spotify.com/documentation/web-api/reference/object-model/#play-history-object
public struct SpotifyPlayHistoryItem {
    public let track: SpotifyTrack
    public let playedAt: Date
    public let context: SpotifyContext?
}

// MARK: - SpotifyPlayHistoryItem Coding Keys
private extension SpotifyPlayHistoryItem {
    enum CodingKeys: String, CodingKey {
        case track
        case playedAt = "played_at"
        case context
    }
}

// MARK: - SpotifyPlayHistoryItem: Decodable
extension SpotifyPlayHistoryItem: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SpotifyPlayHistoryItem.CodingKeys.self)

        track = try container.decode(SpotifyTrack.self, forKey: .track)
        playedAt = try container.decodeDate(keyedBy: .playedAt)
        context = try container.decodeIfPresent(SpotifyContext.self, forKey: .context)
    }
}

// MARK: - SpotifyPlayHistoryItem: Equatable
extension SpotifyPlayHistoryItem: Equatable {
    public static func == (lhs: SpotifyPlayHistoryItem, rhs: SpotifyPlayHistoryItem) -> Bool {
        return (lhs.context == rhs.context) && (lhs.playedAt == rhs.playedAt) && (lhs.track == rhs.track)
    }
}
